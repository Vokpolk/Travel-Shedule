import SwiftUI

struct ServerErrorView: View {
    var body: some View {
        VStack {
            Image(ErrorType.server.image)
            Text(ErrorType.server.description)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.ypBlack)
        }
    }
}

#Preview {
    ServerErrorView()
}
