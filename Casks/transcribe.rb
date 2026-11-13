cask "transcribe" do
  version "1.1.5"
  sha256 "60f3c94090c6757dfda11d463d8e0664d0df261c4eaf82d2201e906e22b293bd"

  url "https://github.com/J3012B/Transcribe_Mac/releases/download/v#{version}/Transcribe-#{version}.dmg"
  name "Transcribe"
  desc "Free, local, on-device audio and video transcription for Mac"
  homepage "https://transcribe.heliconsolutions.net/"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Transcribe.app"

  caveats <<~EOS
    Transcribe is not yet notarized by Apple. If macOS blocks it on first launch,
    right-click the app in Applications and choose Open, or reinstall with:
      brew install --cask --no-quarantine transcribe

    First launch downloads the Whisper speech model once (~650 MB), then it runs
    fully offline.
  EOS

  zap trash: [
    "~/Library/Application Support/Transcribe",
    "~/Library/HTTPStorages/net.heliconsolutions.transcribe",
    "~/Library/Preferences/net.heliconsolutions.transcribe.plist",
  ]
end
