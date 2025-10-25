import SwiftUI

struct ChooseStationRowView: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 17, weight: .regular))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.black) // Черная стрелка
                .font(.system(size: 18, weight: .medium))
        }
        .padding(.vertical, 18) // Вертикальный паддинг для удобства тапа
        .contentShape(Rectangle())
    }
}

#Preview {
    ChooseStationRowView(title: "L")
}
