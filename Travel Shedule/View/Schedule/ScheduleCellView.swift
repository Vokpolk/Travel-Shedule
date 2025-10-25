import SwiftUI

struct ScheduleCellView: View {
    @State private var firstCity: String = ""
    @State private var secondCity: String = ""
    @Binding var viewModel: SourceViewModel
    
    private let height: Double = 128
    
//    let systemImageName: String
    let action: () -> Void
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.red)
                .frame(height: height)
            HStack(spacing: 16) {
                VStack {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .frame(height: height - 16 * 2)
                        VStack(alignment: .leading, spacing: 25) {
                            NavigationLink(destination: ChooseCityView(viewModel: $viewModel, city: $firstCity)) {
                                Text(firstCity.isEmpty ? "Откуда" : firstCity)
                                    .padding(.horizontal, 16)
                                    .foregroundStyle(firstCity.isEmpty ? .gray : .black)
                            }
                            NavigationLink(destination: ChooseCityView(viewModel: $viewModel, city: $secondCity)) {
                                Text(secondCity.isEmpty ? "Куда" : secondCity)
                                    .padding(.horizontal, 16)
                                    .foregroundStyle(secondCity.isEmpty ? .gray : .black)
                            }
                        }
                    }
                }
                .cornerRadius(20)
                .frame(height: 96)
                .padding(.leading, 16)
                Button(action: action) {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.system(size: 18, weight: .regular))
                        .foregroundColor(.blue)
                        .frame(width: 36, height: 36)
                        .background(Circle().fill(Color.white))
                        .padding(.trailing, 16)
                }
            }
            
        }
        .frame(height: height)
        .padding(.horizontal, 16)
    }
}

//#Preview {
//    ScheduleCellView(viewModel: SourceViewModel()) {
//        print("TEST")
//    }
//}
