import SwiftUI

struct ChooseStationRowView: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.ypBlack)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.ypBlack)
                .font(.system(size: 18, weight: .medium))
        }
        .padding(.vertical, 18)
        .contentShape(Rectangle())
    }
}

#Preview {
    ChooseStationRowView(title: "L")
}
