cask "brave-browser-nightly" do
  arch arm: "arm64", intel: "x64"
  folder = on_arch_conditional arm: "nightly-arm64", intel: "nightly"

  version "1.52.60.0,152.60"
  sha256 arm:   "dbf6d4410d75a29e0f7afdf223cd42de382ee3314b56d31820271eba2d8a414f",
         intel: "3e49bc1e51523526b74ba5a50b6cbf6fd1aba43c94a48cb87313450921bd8c6d"

  url "https://updates-cdn.bravesoftware.com/sparkle/Brave-Browser/#{folder}/#{version.csv.second}/Brave-Browser-Nightly-#{arch}.dmg",
      verified: "updates-cdn.bravesoftware.com/sparkle/Brave-Browser/"
  name "Brave Nightly"
  desc "Web browser focusing on privacy"
  homepage "https://brave.com/download-nightly/"

  livecheck do
    url "https://updates.bravesoftware.com/sparkle/Brave-Browser/#{folder}/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "Brave Browser Nightly.app"

  zap trash: [
    "~/Library/Application Support/brave",
    "~/Library/Preferences/com.electron.brave.plist",
    "~/Library/Saved Application State/com.electron.brave.savedState",
  ]
end
