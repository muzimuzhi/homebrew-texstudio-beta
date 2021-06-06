cask "texstudio-beta" do
  version "4.0.0alpha1"
  sha256 "144413c63ec87f387bd6ae6f5e6a311f50547d0ddd59f329071b81e1d73d2908"

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
