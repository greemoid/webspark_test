br:
	fvm dart run build_runner build --delete-conflicting-outputs
watch:
	fvm dart run build_runner watch
get:
	fvm flutter pub get
clean:
	fvm flutter clean
prepare:
	fvm flutter pub get
	fvm dart run build_runner build --delete-conflicting-outputs
apk:
	fvm flutter build apk --target-platform android-arm64