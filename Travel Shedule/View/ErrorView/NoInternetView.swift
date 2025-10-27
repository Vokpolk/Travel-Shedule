import SwiftUI

struct NoInternetView: View {
    var body: some View {
        VStack {
            Image(ErrorType.connection.image)
            Text(ErrorType.connection.description)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.ypBlack)
        }
    }
}

#Preview {
    NoInternetView()
}
