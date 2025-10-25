import SwiftUI

struct ChooseCityView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) private var dismiss
    @Binding var viewModel: SourceViewModel
    @Binding var city: String
    @State var station: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 6)
                TextField("Введите запрос", text: $city)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 9)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(.rect(cornerRadius: 12))
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            if !city.isEmpty {
                                Button(action: {
                                    city = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 10)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 16)
                Spacer(minLength: 20)
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.cities) { settlement in
                            NavigationLink(destination: ChooseStationView(viewModel: viewModel, city: $city, station: $station)) {
                                ChooseCityRowView(title: settlement.name)
                            }
                            .listRowBackground(Color.clear)
                            .padding(.horizontal, 16)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .tint(.black)
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .navigationTitle("Выбор города")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Кастомная кнопка назад в виде галочки
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left") // Галочка (стрелка влево)
                .foregroundColor(.black) // Черный цвет
                .font(.system(size: 18, weight: .medium))
                .padding(8)
        }
    }
}

//#Preview {
//    ChooseCityViewWrapper()
//}
//
//struct ChooseCityViewWrapper: View {
//    @State private var city = ""
//    @State private var viewModel = SourceViewModel()
//    @State private var station = ""
//
//    var body: some View {
//        ChooseCityView(viewModel: $viewModel, city: $city)
//    }
//}
