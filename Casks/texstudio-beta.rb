cask "texstudio-beta" do
  version "4.0.0alpha2"
  sha256 "15c6bccf7e585689c7c14ad881c1eaa56d1fd01936be1a931a037d2ee8100b7d"

  # github.com/texstudio-org/texstudio/ was verified as official when first introduced to the cask
  url "https://github.com/texstudio-org/texstudio/releases/download/#{version}/texstudio-#{version}-osx.dmg",
      verified: "https://github.com/texstudio-org/texstudio/"
  appcast "https://github.com/texstudio-org/texstudio/releases.atom"
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
