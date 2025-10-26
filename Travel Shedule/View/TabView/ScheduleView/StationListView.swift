import SwiftUI

struct StationListView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var path: [Route]
    @Binding var viewModel: SourceViewModel
    @Binding var city: City
    @State var stationName: String = ""
    var isFrom: Bool
    
    private var searchResults: [Station] {
        if stationName.isEmpty {
            return city.stations
        } else {
            return city.stations.filter {
                $0.name.contains(stationName)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 6)
            TextField("Введите запрос", text: $stationName)
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
                        
                        if !stationName.isEmpty {
                            Button(action: {
                                stationName = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 10)
                            }
                        }
                    }
                )
                .padding(.horizontal, 16)
            
            ScrollView {
                LazyVStack {
                    ForEach(searchResults) { station in
                        ChooseStationRowView(title: station.name)
                            .listRowBackground(Color.clear)
                            .padding(.horizontal, 16)
                            .onTapGesture {
                                stationName = station.name
                                if isFrom {
                                    viewModel.firstData.stationName = station.name
                                    viewModel.firstData.code = station.code
                                } else {
                                    viewModel.secondData.stationName = station.name
                                    viewModel.secondData.code = station.code
                                }
                                path.removeAll()
                            }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .tint(.ypBlack)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .navigationTitle("Выбор станции")
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
