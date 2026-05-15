# Deploying to appdb.to

appdb.to is an independent marketplace for iOS/iPadOS/macOS apps. It distributes apps via sideloading (OTA), no App Store review required.

## Prerequisites

1. **Apple Developer Account** — paid enrollment needed for code signing
2. **appdb Developer Account** — register at https://appdb.to/developers (free)
3. **Provisioning Profile** — ad-hoc distribution profile from Apple Developer portal

## Firebase Config

Firebase requires platform-specific config files that are **not committed** to version control (they contain API keys). Place them manually:

| Platform | File | Path |
|----------|------|------|
| Android | `google-services.json` | `android/app/google-services.json` |
| iOS | `GoogleService-Info.plist` | `ios/Runner/GoogleService-Info.plist` |

Download these from the Firebase Console → Project Settings → Your Apps → Config files.

## Build IPA for appdb

```bash
make build-ipa
```

This runs `flutter build ipa --export-method ad-hoc` and outputs the IPA to:
`build/ios/ipa/nutriq.ipa`

## ExportOptions.plist

`ios/ExportOptions.plist` configures the Xcode archive export. **Replace `TEAM_ID_PLACEHOLDER` with your Apple Team ID** before building:

```xml
<key>teamID</key>
<string>YOUR_TEAM_ID</string>
```

Do **not** commit your real Team ID. The placeholder file is tracked; replace it locally.

## Upload to appdb

Via web dashboard:
1. Log in at https://appdb.to/developers
2. Click **Add New App**
3. Fill in metadata (name, description, category, screenshots, icon)
4. Upload the IPA from `build/ios/ipa/nutriq.ipa`

Via API (if available): see appdb.to developer documentation for API endpoints.

## App Metadata

| Field | Value |
|-------|-------|
| Bundle ID | `com.nutriq.app` |
| Version | From `pubspec.yaml` (currently `1.0.0+41`) |
| App Name | Nutriq |
| Icon | `assets/icon/ont_logo_square.png` |

## Signing Notes

- appdb uses **ad-hoc** distribution, not App Store
- If you also deploy to the App Store, keep separate export options or use `--export-method` per target
- Ensure your provisioning profile includes test devices if distributing to specific UDIDs