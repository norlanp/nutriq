package com.nutriq.app.widget

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.SharedPreferences
import android.view.View
import android.widget.RemoteViews

class NutriqHomeWidgetProvider : AppWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    companion object {
        private const val PREFS_NAME = "FlutterSharedPreferences"

        private fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

            val kcalRemaining = prefs.getFloat("widget_kcal_remaining", 2000f).toInt()
            val kcalGoal = prefs.getFloat("widget_kcal_goal", 2000f).toInt()
            val kcalConsumed = prefs.getFloat("widget_kcal_consumed", 0f).toInt()
            val carbsGoal = prefs.getFloat("widget_carbs_goal", 250f).toInt()
            val carbsConsumed = prefs.getFloat("widget_carbs_consumed", 0f).toInt()
            val fatsGoal = prefs.getFloat("widget_fats_goal", 65f).toInt()
            val fatsConsumed = prefs.getFloat("widget_fats_consumed", 0f).toInt()
            val proteinsGoal = prefs.getFloat("widget_proteins_goal", 120f).toInt()
            val proteinsConsumed = prefs.getFloat("widget_proteins_consumed", 0f).toInt()

            val views = RemoteViews(context.packageName, R.layout.widget_home_screen)

            views.setTextViewText(R.id.tv_kcal_remaining, "$kcalRemaining")
            views.setTextViewText(R.id.tv_kcal_label, "kcal left")
            views.setTextViewText(R.id.tv_kcal_goal, "$kcalConsumed / $kcalGoal")

            views.setTextViewText(R.id.tv_carbs, "C: $carbsConsumed / $carbsGoal")
            views.setTextViewText(R.id.tv_fats, "F: $fatsConsumed / $fatsGoal")
            views.setTextViewText(R.id.tv_proteins, "P: $proteinsConsumed / $proteinsGoal")

            val kcalProgress = if (kcalGoal > 0) {
                ((kcalConsumed.toFloat() / kcalGoal.toFloat()) * 100).coerceAtMost(100)
            } else 0f
            views.setProgressBar(R.id.progress_kcal, 100, kcalProgress.toInt(), 0)

            val carbsProgress = if (carbsGoal > 0) {
                ((carbsConsumed.toFloat() / carbsGoal.toFloat()) * 100).coerceAtMost(100)
            } else 0f
            views.setProgressBar(R.id.progress_carbs, 100, carbsProgress.toInt(), 0)

            val fatsProgress = if (fatsGoal > 0) {
                ((fatsConsumed.toFloat() / fatsGoal.toFloat()) * 100).coerceAtMost(100)
            } else 0f
            views.setProgressBar(R.id.progress_fats, 100, fatsProgress.toInt(), 0)

            val proteinsProgress = if (proteinsGoal > 0) {
                ((proteinsConsumed.toFloat() / proteinsGoal.toFloat()) * 100).coerceAtMost(100)
            } else 0f
            views.setProgressBar(R.id.progress_proteins, 100, proteinsProgress.toInt(), 0)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}