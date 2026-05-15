import WidgetKit
import SwiftUI

struct NutriqLockScreenEntry: TimelineEntry {
    let date: Date
    let kcalRemaining: Double
    let kcalGoal: Double
    let kcalConsumed: Double
}

struct NutriqLockScreenProvider: TimelineProvider {
    func placeholder(in context: Context) -> NutriqLockScreenEntry {
        NutriqLockScreenEntry(
            date: Date(),
            kcalRemaining: 800,
            kcalGoal: 2000,
            kcalConsumed: 1200
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (NutriqLockScreenEntry) -> Void) {
        let entry = loadEntry()
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<NutriqLockScreenEntry>) -> Void) {
        let entry = loadEntry()
        let nextUpdate = Calendar.current.date(byAdding: .minute, value: 30, to: Date())!
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
        completion(timeline)
    }

    private func loadEntry() -> NutriqLockScreenEntry {
        let defaults = UserDefaults(suiteName: "group.com.nutriq.app")
        return NutriqLockScreenEntry(
            date: Date(),
            kcalRemaining: defaults?.double(forKey: "widget_kcal_remaining") ?? 2000,
            kcalGoal: defaults?.double(forKey: "widget_kcal_goal") ?? 2000,
            kcalConsumed: defaults?.double(forKey: "widget_kcal_consumed") ?? 0
        )
    }
}

struct NutriqLockScreenWidgetEntryView: View {
    var entry: NutriqLockScreenProvider.Entry

    private var progress: Double {
        guard entry.kcalGoal > 0 else { return 0 }
        return min(entry.kcalConsumed / entry.kcalGoal, 1.0)
    }

    var body: some View {
        AccessoryCircularGauge(progress: progress) {
            Text("\(Int(entry.kcalRemaining))")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
        }
        .gaugeStyle(.accessoryCircular)
    }
}

struct NutriqLockScreenWidget: Widget {
    let kind: String = "NutriqLockScreenWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: NutriqLockScreenProvider()) { entry in
            NutriqLockScreenWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Nutriq Calories")
        .description("Remaining calories ring for lock screen.")
        .supportedFamilies([.accessoryCircular])
    }
}