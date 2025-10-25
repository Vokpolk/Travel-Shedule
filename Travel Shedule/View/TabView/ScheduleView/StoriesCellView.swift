import SwiftUI

struct StoriesCellView: View {
    let imageHeight: Double = 140
    let imageWidth: Double = 92
    
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 16)
                .fill(.ypBlueUniversal)
                .frame(width: imageWidth, height: imageHeight)
            
            Text("Text Text Text Text Text Text Text Text Text")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.white)
                .frame(width: 86, height: 45)
                .padding()
        }
        .frame(width: imageWidth, height: imageHeight)
    }
}

#Preview {
    StoriesCellView()
}
