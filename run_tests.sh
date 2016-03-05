
xcodebuild -project MDevCon2015Demo.xcodeproj -scheme MDevCon2015DemoTests -sdk iphonesimulator  -destination 'platform=iOS Simulator,name=iPhone 6,OS=latest' test | bundle exec xcpretty
