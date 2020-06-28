cask 'texstudio-beta' do
  version '3.0.0beta1'
  sha256 '479a688a36ac9bda0a0b32fc4f9edb56c8151a7581adf06ed820ac24e90895b9'

  # github.com/texstudio-org/texstudio/ was verified as official when first introduced to the cask
  url "https://github.com/texstudio-org/texstudio/releases/download/#{version}/texstudio-#{version}-osx.dmg"
  appcast 'https://github.com/texstudio-org/texstudio/releases.atom'
  name 'TeXstudio'
  homepage 'https://texstudio.org/'

  conflicts_with cask: 'texstudio'

  app 'texstudio.app'

  zap trash: [
               '~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/texstudio.sfl*',
               '~/Library/Preferences/texstudio.plist',
               '~/Library/Saved Application State/texstudio.savedState',
             ]
end
