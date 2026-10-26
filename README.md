# Homebrew tap

Trust the tap once, then install any formula:

```sh
brew trust brettinternet/tap
brew install brettinternet/tap/bl
```

| Formula | Project |
| --- | --- |
| `bl` | [backlog](https://github.com/brettinternet/backlog): keyboard-first terminal backlog for people and coding agents |
| `hum` | [Hum](https://github.com/brettinternet/hum): local development process supervisor |
| `noon` | [Noon](https://github.com/brettinternet/noon): repository job scheduler |
| `tell` | [Tell](https://github.com/brettinternet/tell): one-shot notifications and agent messages |
| `worklease` | [Worklease](https://github.com/brettinternet/worklease): task and resource lease coordination for local workers |

Every formula installs a prebuilt binary for macOS and Linux on arm64 and x64. Installing or
upgrading `noon` doesn't start a scheduler or install a service; run `noon service install` when
ready.

Update installed formulae with `brew update && brew upgrade`.

## Releases

The [Update formulae](.github/workflows/update-formulae.yml) workflow runs every six hours and
on demand. It points each formula at its project's latest stable release, using that release's
`checksums.txt`, then runs `brew style`, a strict online audit, and install and test for each
changed formula before committing.

To add a formula, write `Formula/NAME.rb` in the same shape as the others, add its release
asset naming to [`update-formulae.rb`](.github/scripts/update-formulae.rb), and run:

```sh
ruby .github/scripts/update-formulae.rb NAME
.github/scripts/check-homebrew-tap.sh brettinternet/tap NAME
```

The check links this checkout as the tap, trusts it for the run, and installs the formula, so
run it where installing into Homebrew is acceptable.
