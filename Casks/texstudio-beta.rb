cask "texstudio-beta" do
  version "3.0.0rc3"
  sha256 "135f867ebed1858187a5d564e666aca871ef21fd799a44b8a2a1fa1f3d0bb69b"

  # github.com/texstudio-org/texstudio/ was verified as official when first introduced to the cask
  url "https://github.com/texstudio-org/texstudio/releases/download/#{version}/texstudio-#{version}-osx.dmg"
  appcast "https://github.com/texstudio-org/texstudio/releases.atom"
  name "TeXstudio"
  homepage "https://texstudio.org/"

  conflicts_with cask: "texstudio"

  app "texstudio.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/texstudio.sfl*",
    "~/Library/Preferences/texstudio.plist",
    "~/Library/Saved Application State/texstudio.savedState",
  ]
end
