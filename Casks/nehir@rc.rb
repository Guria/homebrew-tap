cask "nehir@rc" do
  version "0.6.0-rc.7"
  sha256 "1241209c03cd5408f10ab13ee6921964182fc4b3c4c6b5f341eb24d7a25e81db"

  url "https://github.com/guria/nehir/releases/download/v#{version}/Nehir-#{version}.zip"
  name "Nehir"
  desc "Scrolling tiling window manager"
  homepage "https://github.com/guria/nehir"

  livecheck do
    url :url
    strategy :github_releases
  end

  conflicts_with cask: "nehir"
  depends_on macos: :sequoia

  app "Nehir.app"
  binary "#{appdir}/Nehir.app/Contents/MacOS/nehirctl"

  uninstall quit: "dev.guria.nehir"

  zap trash: [
    "~/.config/nehir",
    "~/Library/Caches/com.nehir",
    "~/Library/Caches/dev.guria.nehir",
    "~/Library/Preferences/dev.guria.nehir.plist",
    "~/Library/Saved Application State/dev.guria.nehir.savedState",
  ]

  caveats <<~EOS
    Nehir requires Accessibility permissions to manage windows:
      System Settings > Privacy & Security > Accessibility

    This cask installs the app and links the bundled CLI as `nehirctl`.
  EOS
end
