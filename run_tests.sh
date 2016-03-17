
xcodebuild -project MDevCon2016Demo.xcodeproj -scheme MDevCon2016DemoTests -sdk iphonesimulator  -destination 'platform=iOS Simulator,name=iPhone 6,OS=latest' test | bundle exec xcpretty
