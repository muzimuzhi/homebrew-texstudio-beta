cask "texstudio-beta" do
  arch arm: "-m1", intel: ""

  version "4.8.5beta1"
  sha256 arm:   "56393c930ac08311d9ee99aac1671e28c8aed8c1e6f7623b1ca087dd4b99e2d3",
         intel: "fd388893fcb7688ea6a28d43f8fbe31aeb396ee28f5c68dde62d6e4711a28b66"

  on_arm do
    depends_on macos: ">= :sonoma"

    # it's NOT recommended to rename the target only for removing version numbers
    # https://docs.brew.sh/Cask-Cookbook#target-should-only-be-used-in-select-cases
    app "texstudio-#{version}-osx-m1.app"
  end
  on_intel do
    depends_on macos: ">= :big_sur"

    app "texstudio-#{version}-osx.app"
  end

  url "https://github.com/texstudio-org/texstudio/releases/download/#{version}/texstudio-#{version}-osx#{arch}.zip",
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
