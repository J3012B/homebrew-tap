cask "transcribe" do
  version "1.1.4"
  sha256 "f4a8482d3dea0d50b99b5814c41958d3fcdd1a9cfb67f3e6dfc770a6972a1e06"

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
