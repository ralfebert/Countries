project:
	xcodegen

format:
	swiftformat --header "© 2019 Ralf Ebert — iOS Example Project: Countries\nLicense: https://opensource.org/licenses/MIT" --swiftversion 5 --indentcase true --stripunusedargs unnamed-only --self insert --disable blankLinesAtStartOfScope,blankLinesAtEndOfScope .
