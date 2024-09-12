cask "texstudio-beta" do
  arch arm: "-m1.zip", intel: ".dmg"

  version "4.8.3alpha1"
  sha256 arm:   "e6311ab4c15f856dbb75ca5270c512c38a224a1fca20febb6be9a93d36f208e0",
         intel: "05fb0081181d45fa2bd5de4ef8635e7a0ee0bde4b0ed01cb658d3d94a365ddbd"

  on_arm do
    depends_on macos: ">= :sonoma"

    app "texstudio-#{version}-osx-m1.app"
  end
  on_intel do
    depends_on macos: ">= :big_sur"

    app "texstudio.app"
  end

  url "https://github.com/texstudio-org/texstudio/releases/download/#{version}/texstudio-#{version}-osx#{arch}",
      verified: "github.com/texstudio-org/texstudio/"
  name "TeXstudio"
  desc "Fully featured LaTeX editor, beta version"
  homepage "https://texstudio.org/"

  livecheck do
    # based on https://docs.brew.sh/Brew-Livecheck#githubreleases-strategy-block
    url :url
    regex(/^v?(\d+(?:\.\d+)+(?:(?:alpha|beta|rc)\d+)?)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
    # :page_match can just list pre-releases
    # learnt from https://github.com/Homebrew/homebrew-cask-versions/blob/948fe36253038658716087daac8c4b1f0ae0f7c3/Casks/utm-beta.rb#L11-L15
    #   url "https://github.com/texstudio-org/texstudio/releases?q=prerelease%3Atrue&expanded=true"
    #   regex(%r{href=["']?[^"' >]*?/tag/v?(\d+(?:\.\d+)+[^"' >]*)["' >]}i)
    #   strategy :page_match
  end

  conflicts_with cask: "texstudio"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/texstudio.sfl*",
    "~/Library/Preferences/texstudio.plist",
    "~/Library/Saved Application State/texstudio.savedState",
  ]
end
