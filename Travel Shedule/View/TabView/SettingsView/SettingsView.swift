import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @Binding var path: [Route]
    var body: some View {
        VStack {
            Toggle("Темная тема", isOn: $themeManager.isDarkMode)
                .foregroundStyle(.ypBlack)
                .toggleStyle(SwitchToggleStyle(tint: .ypBlueUniversal))
                .padding(.vertical, 20)
            HStack {
                Text("Пользовательское соглашение")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.ypBlack)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.ypBlack)
            }
            .onTapGesture {
                path.append(.userAgreement)
            }
            Spacer()
            Text("Приложение использует API \"Яндекс.Расписания\"")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.ypBlack)
            Text("Версия 1.0 (beta")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.ypBlack)
        }
        .padding()
        .preferredColorScheme(themeManager.isDarkMode ? .dark : .light)
    }
}
