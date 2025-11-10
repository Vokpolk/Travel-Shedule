import SwiftUI

@main
struct Travel_SheduleApp: App {
    private var themeManager = ThemeManagerViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView(themeManager: themeManager)
                .environment(themeManager)
                .preferredColorScheme(themeManager.colorScheme)
        }
    }
}
