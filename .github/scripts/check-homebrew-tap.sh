#!/usr/bin/env bash
set -euo pipefail

tap_name=${1:?usage: check-homebrew-tap.sh owner/tap formula...}
shift
if (($# == 0)); then
  echo "usage: check-homebrew-tap.sh owner/tap formula..." >&2
  exit 2
fi
formulas=("$@")

if [[ ! "$tap_name" =~ ^[A-Za-z0-9-]+/[A-Za-z0-9-]+$ ]]; then
  echo "invalid tap name" >&2
  exit 2
fi
for formula in "${formulas[@]}"; do
  if [[ ! "$formula" =~ ^[A-Za-z0-9@+._-]+$ ]]; then
    echo "invalid formula name: $formula" >&2
    exit 2
  fi
done

brew_repository=$(brew --repository)
tap_owner=${tap_name%%/*}
tap_repository=${tap_name#*/}
tap_path="$brew_repository/Library/Taps/$tap_owner/homebrew-$tap_repository"
target_path=$(pwd -P)

if [[ -e "$tap_path" || -L "$tap_path" ]]; then
  echo "Homebrew tap path already exists: $tap_path" >&2
  exit 1
fi

added_trust=false
cleanup() {
  if [[ "$added_trust" == true ]]; then
    brew untrust --tap "$tap_name"
  fi
  if [[ -L "$tap_path" && $(readlink "$tap_path") == "$target_path" ]]; then
    unlink "$tap_path"
  fi
}
trap cleanup EXIT

mkdir -p "$(dirname "$tap_path")"
ln -s "$target_path" "$tap_path"

# Homebrew refuses to load formulae from untrusted taps. Trust this one for the
# check, and remove the trust afterwards only if the check added it.
trust_before=$(brew trust --json v1)
brew trust --tap "$tap_name"
if [[ $(brew trust --json v1) != "$trust_before" ]]; then
  added_trust=true
fi

brew style "$tap_name"
brew audit --strict --online --tap="$tap_name"
for formula in "${formulas[@]}"; do
  brew install --formula "$tap_name/$formula"
  brew test "$tap_name/$formula"
done
