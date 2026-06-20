cask "ytm-menu-bar" do
  version "0.1.3"
  sha256 "559370172a82b55dea9bf6ca74eb5709b2b01efe328171d246e3a06e5ed786e9"

  url "https://github.com/gormanity/ytm-enhancer/releases/download/menu-bar-v0.1.3/YTM-Menu-Bar-Homebrew-0.1.3.pkg"
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
