cask "ytm-menu-bar" do
  version "0.1.0"
  sha256 "f73819ff2c0eed270c8c8a927f7d84cb64dc94d555a4e52d7c4708946481e146"

  url "https://github.com/gormanity/ytm-enhancer/releases/download/menu-bar-v0.1.0/YTM-Menu-Bar-Homebrew-0.1.0.pkg"
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
