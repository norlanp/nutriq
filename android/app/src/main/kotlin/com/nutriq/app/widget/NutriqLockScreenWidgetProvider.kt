package com.nutriq.app.widget

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import com.nutriq.app.R

class NutriqLockScreenWidgetProvider : AppWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            updateLockScreenWidget(context, appWidgetManager, appWidgetId)
        }
    }

    companion object {
        private const val PREFS_NAME = "FlutterSharedPreferences"

        private fun updateLockScreenWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

            val kcalRemaining = prefs.getFloat("widget_kcal_remaining", 2000f).toInt()
            val kcalConsumed = prefs.getFloat("widget_kcal_consumed", 0f).toInt()
            val kcalGoal = prefs.getFloat("widget_kcal_goal", 2000f).toInt()

            val views = RemoteViews(context.packageName, R.layout.widget_lock_screen)

            views.setTextViewText(R.id.tv_lock_kcal_remaining, "$kcalRemaining")
            views.setTextViewText(R.id.tv_lock_kcal_label, "kcal left")

            val progress = if (kcalGoal > 0) {
                ((kcalConsumed.toFloat() / kcalGoal.toFloat()) * 100).coerceAtMost(100f)
            } else 0f
            views.setProgressBar(R.id.progress_lock_kcal, 100, progress.toInt(), false)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}