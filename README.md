# Homebrew tap

Install a formula:

```sh
brew trust --formula brettinternet/tap/hum
brew install brettinternet/tap/hum

brew trust --formula brettinternet/tap/worklease
brew install brettinternet/tap/worklease

brew trust --formula brettinternet/tap/tell
brew install brettinternet/tap/tell

brew trust --formula brettinternet/tap/noon
brew install brettinternet/tap/noon
```

Available formulae:

- [Noon](https://github.com/brettinternet/noon) — repository job scheduler
- [Tell](https://github.com/brettinternet/tell) — one-shot notifications and agent messages
- [Hum](https://github.com/brettinternet/hum) — local development process supervisor
- [Worklease](https://github.com/brettinternet/worklease) — task and resource lease coordination for local workers

## Noon

Install with `brew install brettinternet/tap/noon` and upgrade with `brew upgrade brettinternet/tap/noon`.
The release targets macOS and Linux on Intel/AMD 64-bit and ARM64. Installation and upgrades do
not start a scheduler or install a service; run `noon service install` explicitly when ready.

To add or update the formula, follow the release procedure in
[Noon's development guide](https://github.com/brettinternet/noon/blob/main/docs/development.md):
download the published archives and checksums, verify them, then run Noon's
`scripts/generate-homebrew-formula.sh VERSION checksums.txt` to generate `Formula/noon.rb`.
Never substitute checksums from a different local build. In a disposable Homebrew environment,
run `.github/scripts/check-homebrew-tap.sh brettinternet/tap noon` (style, strict online audit,
install, and test), then Noon's `task release:smoke` against the installed binary. Commit and
push the tap update only with authorization.

## Upgrades

Update installed formulae:

```sh
brew update
brew upgrade
```
