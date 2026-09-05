# Gormanity Homebrew Tap

Homebrew packages for Gormanity apps and tools.

## YTM Menu Bar

Menu bar playback controls for YouTube Music through
[YTM Enhancer](https://github.com/gormanity/ytm-enhancer). Requires macOS Ventura
or later on an Intel or Apple silicon Mac, plus the YTM Enhancer browser
extension.

```sh
brew install --cask gormanity/tap/ytm-menu-bar
brew upgrade --cask gormanity/tap/ytm-menu-bar
brew uninstall --cask gormanity/tap/ytm-menu-bar
```

Homebrew manages updates for this package. The installer includes the browser
native messaging hosts, and uninstall removes their package receipts and files.
Use `brew uninstall --cask --zap gormanity/tap/ytm-menu-bar` to also remove the
app's preferences, caches, and logs.

## Maintenance

The YTM Enhancer release workflow generates `Casks/ytm-menu-bar.rb` from
`apps/menu-bar/release/homebrew/ytm-menu-bar.rb.template` and
`apps/menu-bar/scripts/generate-homebrew-cask.mjs` in the upstream repository.
Make lasting cask changes there too, so the next release preserves them.

With this checkout registered as `gormanity/tap`, run:

```sh
brew style Casks
brew audit --cask --strict --online --tap=gormanity/tap
brew livecheck --cask --tap=gormanity/tap
```

CI runs these checks on pushes, pull requests, and a weekly schedule. The online
audit downloads and inspects the published package without installing it.
