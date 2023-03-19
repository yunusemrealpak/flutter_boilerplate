if [ $1 == "watch" ]
then
flutter packages pub run build_runner watch
elif [ $1 == "clean"]
then
flutter clean
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
else
flutter packages pub run build_runner build --delete-conflicting-outputs
fi