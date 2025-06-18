FLUTTER := $(shell which flutter)
## clean: Run 'flutter clean'
clean:
	@echo "🔄 Running flutter clean..."
	$(FLUTTER) clean

## pub-get: Run 'flutter pub get'
pub-get:
	@echo "📦 Getting Flutter packages..."
	$(FLUTTER) pub get

## build-apk: Build APK (--release mode)
build-apk:
	@echo "🔨 Building APK (release)..."
	$(FLUTTER) build apk --release
 
## run: Run app in debug mode
run-debug:
	@echo "🚀 Running app in debug mode..."
	$(FLUTTER) run

## run: Run app in release mode
run-release:
	@echo "🚀 Running app in release mode..."
	$(FLUTTER) run --release

## all: Clean → Get packages → Build APK -> Run
android-run-debug: clean pub-get build-apk run-debug
android-run-release: clean pub-get build-apk run-release

.PHONY: help clean pub-get build-apk build-appbundle run all