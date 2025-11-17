import SwiftUI

@Observable final class ThemeManagerViewModel {
    var isDarkMode: Bool {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
            updateColorScheme()
        }
    }
    
    var colorScheme: ColorScheme = .light
    
    init() {
        self.isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        self.updateColorScheme()
    }
    
    private func updateColorScheme() {
        colorScheme = isDarkMode ? .dark : .light
    }
}
