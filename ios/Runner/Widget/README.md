# iOS WidgetKit Extension Setup

The Swift source files for the home screen and lock screen widgets are in this directory. To add them to the Xcode project:

## Steps

1. Open `Runner.xcworkspace` in Xcode.
2. File → New → Target → Widget Extension.
3. Name it `NutriqWidget` (or any name; update `kind` strings if changed).
4. Delete the auto-generated Swift files from the new target.
5. Add all `.swift` files from this `Widget/` directory to the new target.
6. In the target's **Signing & Capabilities**:
   - Add the **App Groups** capability.
   - Create/enable the group `group.com.nutriq.app`.
7. In the main Runner target, ensure the same App Group `group.com.nutriq.app` is enabled.
8. In **Build Phases** → **Link Binary With Libraries**, ensure `SwiftUI` and `WidgetKit` are linked.
9. Set the **Deployment Target** of the Widget Extension to iOS 16.0+ (lock screen widgets require iOS 16+).
10. Build and run. The widgets should appear in the widget gallery.

## Notes

- The `home_widget` Flutter package writes data to `UserDefaults` with the suite name `group.com.nutriq.app`. The iOS widget reads from the same suite.
- The `@main` attribute is on `NutriqWidgetBundle` which bundles both `NutriqHomeWidget` and `NutriqLockScreenWidget`.
- Lock screen (accessoryCircular) widgets require iOS 16+.