import WidgetKit
import SwiftUI

struct NutriqHomeWidgetEntry: TimelineEntry {
    let date: Date
    let kcalGoal: Double
    let kcalConsumed: Double
    let kcalRemaining: Double
    let carbsGoal: Double
    let carbsConsumed: Double
    let fatsGoal: Double
    let fatsConsumed: Double
    let proteinsGoal: Double
    let proteinsConsumed: Double
    let waterGoal: Double
    let waterConsumed: Double
}

struct NutriqHomeWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> NutriqHomeWidgetEntry {
        NutriqHomeWidgetEntry(
            date: Date(),
            kcalGoal: 2000,
            kcalConsumed: 1200,
            kcalRemaining: 800,
            carbsGoal: 250,
            carbsConsumed: 150,
            fatsGoal: 65,
            fatsConsumed: 40,
            proteinsGoal: 120,
            proteinsConsumed: 75,
            waterGoal: 2000,
            waterConsumed: 1000
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (NutriqHomeWidgetEntry) -> Void) {
        let entry = loadEntry()
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<NutriqHomeWidgetEntry>) -> Void) {
        let entry = loadEntry()
        let nextUpdate = Calendar.current.date(byAdding: .minute, value: 30, to: Date())!
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
        completion(timeline)
    }

    private func loadEntry() -> NutriqHomeWidgetEntry {
        let defaults = UserDefaults(suiteName: "group.com.nutriq.app")
        return NutriqHomeWidgetEntry(
            date: Date(),
            kcalGoal: defaults?.double(forKey: "widget_kcal_goal") ?? 2000,
            kcalConsumed: defaults?.double(forKey: "widget_kcal_consumed") ?? 0,
            kcalRemaining: defaults?.double(forKey: "widget_kcal_remaining") ?? 2000,
            carbsGoal: defaults?.double(forKey: "widget_carbs_goal") ?? 250,
            carbsConsumed: defaults?.double(forKey: "widget_carbs_consumed") ?? 0,
            fatsGoal: defaults?.double(forKey: "widget_fats_goal") ?? 65,
            fatsConsumed: defaults?.double(forKey: "widget_fats_consumed") ?? 0,
            proteinsGoal: defaults?.double(forKey: "widget_proteins_goal") ?? 120,
            proteinsConsumed: defaults?.double(forKey: "widget_proteins_consumed") ?? 0,
            waterGoal: defaults?.double(forKey: "widget_water_goal") ?? 2000,
            waterConsumed: defaults?.double(forKey: "widget_water_consumed") ?? 0
        )
    }
}

struct NutriqHomeWidgetEntryView: View {
    var entry: NutriqHomeWidgetProvider.Entry

    var body: some View {
        VStack(spacing: 8) {
            CalorieRingView(
                consumed: entry.kcalConsumed,
                goal: entry.kcalGoal,
                remaining: entry.kcalRemaining
            )

            HStack(spacing: 6) {
                MacroBarView(label: "C", consumed: entry.carbsConsumed, goal: entry.carbsGoal, color: .blue)
                MacroBarView(label: "F", consumed: entry.fatsConsumed, goal: entry.fatsGoal, color: .yellow)
                MacroBarView(label: "P", consumed: entry.proteinsConsumed, goal: entry.proteinsGoal, color: .red)
            }
        }
        .padding()
    }
}

struct CalorieRingView: View {
    let consumed: Double
    let goal: Double
    let remaining: Double

    private var progress: Double {
        guard goal > 0 else { return 0 }
        return min(consumed / goal, 1.0)
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 10)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.accentColor, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(.degrees(-90))
            VStack(spacing: 2) {
                Text("\(Int(remaining))")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .minimumScaleFactor(0.5)
                Text("kcal left")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct MacroBarView: View {
    let label: String
    let consumed: Double
    let goal: Double
    let color: Color

    private var progress: Double {
        guard goal > 0 else { return 0 }
        return min(consumed / goal, 1.0)
    }

    var body: some View {
        VStack(spacing: 4) {
            Text(label)
                .font(.caption2)
                .fontWeight(.semibold)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(Color.gray.opacity(0.2))
                    RoundedRectangle(cornerRadius: 3)
                        .fill(color)
                        .frame(width: geometry.size.width * progress)
                }
            }
            .frame(height: 6)
            Text("\(Int(consumed))/\(Int(goal))")
                .font(.system(size: 8))
                .foregroundColor(.secondary)
        }
    }
}

@main
struct NutriqWidgetBundle: WidgetBundle {
    var body: some Widget {
        NutriqHomeWidget()
        NutriqLockScreenWidget()
    }
}

struct NutriqHomeWidget: Widget {
    let kind: String = "NutriqHomeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: NutriqHomeWidgetProvider()) { entry in
            NutriqHomeWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Nutriq Home")
        .description("Show remaining calories and macros.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}