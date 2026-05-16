.PHONY: run-ios run-android \
       build-apk build-apk-debug build-ios build-android build-mobile \
       codegen codegen-watch l10n \
       analyze test format format-check lint \
       clean \
       get upgrade \
       db-reset \
       setup check

# ── Run ──────────────────────────────────────────────────────────────

run-ios:
	flutter run -d ios

run-android:
	flutter run -d android

# ── Build ────────────────────────────────────────────────────────────

build-apk:
	flutter build apk

build-apk-debug:
	flutter build apk --debug

build-android:
	flutter build apk --release

build-ios:
	flutter build ipa --export-method ad-hoc

build-mobile: build-android build-ios

# ── Code Generation ─────────────────────────────────────────────────

codegen:
	dart run build_runner build --delete-conflicting-outputs

codegen-watch:
	dart run build_runner watch --delete-conflicting-outputs

l10n:
	flutter gen-l10n

# ── Quality ──────────────────────────────────────────────────────────

analyze:
	flutter analyze

test:
	flutter test

format:
	dart format lib/ test/

format-check:
	dart format --set-exit-if-changed lib/ test/

lint: analyze format-check test

# ── Clean ────────────────────────────────────────────────────────────

clean:
	flutter clean

# ── Dependencies ─────────────────────────────────────────────────────

get:
	flutter pub get

upgrade:
	flutter pub upgrade

# ── DB Reset ─────────────────────────────────────────────────────────

# macOS: simulator/Documents/ || device app sandbox
# Android: /data/data/com.nutriq.app/databases/
# iOS: Simulator container Documents/
DB_NAME := nutriq.db

db-reset:
	@echo "Resetting local SQLite DB..."
	@PLATFORM=$$(uname -s); \
	if [ "$$PLATFORM" = "Darwin" ]; then \
		find ~/Library/Developer/CoreSimulator/Devices -name "$(DB_NAME)" -exec rm -v {} \; 2>/dev/null; \
		rm -f ~/Library/Developer/CoreSimulator/Devices/*/data/Containers/Data/Application/*/Documents/$(DB_NAME) 2>/dev/null; \
		echo "iOS Simulator DBs cleared."; \
	else \
		echo "On Android, use: adb shell run-as com.nutriq.app rm /data/data/com.nutriq.app/databases/$(DB_NAME)"; \
	fi
	@echo "Done. Re-launch the app to recreate the database."

# ── Convenience ─────────────────────────────────────────────────────

setup: get codegen l10n

check: analyze format-check test