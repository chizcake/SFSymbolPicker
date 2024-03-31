import OSLog

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!

    static let picker = Logger(subsystem: subsystem, category: "SFSymbolPicker")
}
