cask "nehir@rc" do
  version "0.6.0-rc.22"
  sha256 "da0128def865f6c33ffc5a06d78353f082ae82ac31725a38840b71b1592cd9d8"

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
