cask "texstudio-beta" do
  version "4.6.0beta3"
  sha256 "7857253d348619d64d352ab7b96db3809e5b8030d5c08193ae7f619f47e0df40"

  url "https://github.com/texstudio-org/texstudio/releases/download/#{version}/texstudio-#{version}-osx.dmg",
      verified: "github.com/texstudio-org/texstudio/"
  name "TeXstudio"
  desc "Fully featured LaTeX editor, beta version"
  homepage "https://texstudio.org/"

  conflicts_with cask: "texstudio"

  app "texstudio.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/texstudio.sfl*",
    "~/Library/Preferences/texstudio.plist",
    "~/Library/Saved Application State/texstudio.savedState",
  ]
end
