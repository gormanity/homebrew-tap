cask "ytm-menu-bar" do
  version "0.0.6"
  sha256 "7db8f2e3de5df696bc6836c1aecc6055ae7d548142441367cf92d1ea0b1aa7ec"

  url "https://github.com/gormanity/ytm-enhancer/releases/download/menu-bar-v0.0.6/YTM-Menu-Bar-Homebrew-0.0.6.pkg"
  name "YTM Menu Bar"
  desc "Menu bar playback controls for YouTube Music through YTM Enhancer"
  homepage "https://github.com/gormanity/ytm-enhancer"

  livecheck do
    url :url
    regex(/^menu-bar-v(\d+(?:\.\d+)+)$/i)
  end

  depends_on macos: :ventura

  pkg "YTM-Menu-Bar-Homebrew-#{version}.pkg"

  uninstall quit: "com.gormanity.ytm-enhancer.menu-bar",
            pkgutil: [
              "com.gormanity.ytm-enhancer.menu-bar.app",
              "com.gormanity.ytm-enhancer.menu-bar.native-hosts",
            ]

  zap trash: [
    "~/Library/Caches/com.gormanity.ytm-enhancer.menu-bar",
    "~/Library/Logs/YTM Menu Bar",
    "~/Library/Preferences/com.gormanity.ytm-enhancer.menu-bar.plist",
  ]

  caveats <<~EOS
    Homebrew owns updates for this install.

      brew upgrade --cask ytm-menu-bar
  EOS
end
