import SwiftUI

struct SettlementListView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var path: [Route]
    @Binding var viewModel: SourceViewModel
    @State var cityName: String = ""
    @Binding var city: City
    @Binding var currentStation: CurrentStation
    var isFrom: Bool
    
    private var searchResults: [City] {
        if cityName.isEmpty {
            return viewModel.cities
        } else {
            return viewModel.cities.filter {
                $0.name.contains(cityName)
            }
        }
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 6)
            TextField("Введите запрос", text: $cityName)
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
                        
                        if !cityName.isEmpty {
                            Button(action: {
                                cityName = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 10)
                            }
                        }
                    }
                )
                .padding(.horizontal, 16)
            if (searchResults.isEmpty && viewModel.isLoaded) {
                Text("Город не найден")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.ypBlack)
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach(searchResults) { settlement in
                            ChooseCityRowView(title: settlement.name)
                                .listRowBackground(Color.clear)
                                .padding(.horizontal, 16)
                                .onTapGesture {
                                    city = settlement
                                    cityName = settlement.name
                                    if isFrom {
                                        viewModel.firstData.settlementName = settlement.name
                                        path.append(.fromStationsListView)
                                    } else {
                                        viewModel.secondData.settlementName = settlement.name
                                        path.append(.toStationsListView)
                                    }
                                }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .navigationTitle("Выбор города")
        .navigationBarTitleDisplayMode(.inline)
        .background(.ypWhite)
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.ypBlack)
                .font(.system(size: 18, weight: .medium))
                .padding(8)
        }
    }
}
