cask "texstudio-beta" do
  version "3.0.0rc1"
  sha256 "8c2e77b5b9364da2dca5dc2683386e6303525be4e5bb03b94771757a5b33421a"

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
