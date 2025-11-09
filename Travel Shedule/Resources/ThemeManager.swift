import SwiftUI

final class ThemeManager: ObservableObject {
    @Published var isDarkMode: Bool {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
            updateColorScheme()
        }
    }
    
    @Published var colorScheme: ColorScheme = .light
    
    init() {
        self.isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        self.updateColorScheme()
    }
    
    private func updateColorScheme() {
        colorScheme = isDarkMode ? .dark : .light
    }
}
