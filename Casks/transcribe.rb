cask "transcribe" do
  version "1.0.0"
  sha256 "f31841b3d94be96a68fb05ac3bd2ca366c483eb90a50498373b5214565bc58ac"

  url "https://github.com/J3012B/Transcribe_Mac/releases/download/v#{version}/Transcribe.zip"
  name "Transcribe"
  desc "Free, local, on-device audio and video transcription for Mac"
  homepage "https://transcribe.heliconsolutions.net/"

  depends_on macos: ">= :sonoma"
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
