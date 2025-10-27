import SwiftUI

struct ChooseCityRowView: View {
    let title: String
        
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.ypBlack)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.ypBlack)
        }
        .padding(.vertical, 18)
        .contentShape(Rectangle())
    }
}

#Preview {
    ChooseCityRowView(title: "Дно")
}
