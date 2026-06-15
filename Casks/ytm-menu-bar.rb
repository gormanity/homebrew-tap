cask "ytm-menu-bar" do
  version "0.0.10"
  sha256 "d69d54074ce0c341f7b318caf59ce17452bcf5b1f282a86cf51982c667ec6424"

  url "https://github.com/gormanity/ytm-enhancer/releases/download/menu-bar-v0.0.10/YTM-Menu-Bar-Homebrew-0.0.10.pkg"
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
