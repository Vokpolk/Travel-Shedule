import SwiftUI

struct CarrierListView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var path: [Route]
    private var viewModel: SourceViewModel
    
    init(path: Binding<[Route]>, viewModel: SourceViewModel) {
        self._path = path
        self.viewModel = viewModel
        Task {
            await viewModel.fetchSchedule(from: viewModel.firstData.code, to: viewModel.secondData.code)
        }
    }
    
    var body: some View {
        Group {
            if !viewModel.serverError {
                VStack {
                    Text("\(viewModel.firstData.stationName) → \(viewModel.secondData.stationName)")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.ypBlack)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .background(.ypWhite)
                    ZStack(alignment: .bottom) {
                        ScrollView {
                            LazyVStack {
                                ForEach(viewModel.schedules) { schedule in
                                    CarrierCellView(schedule: schedule)
                                }
                            }
                            .listStyle(PlainListStyle())
                            .tint(.ypBlack)
                            Spacer()
                        }
                        .background(.ypWhite)
                        
                        Button("Уточнить время") {
                            path.append(.scheduleFilterView)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .tint(.white)
                        .background(.ypBlueUniversal)
                        .clipShape(.rect(cornerRadius: 16))
                        .font(.system(size: 17, weight: .bold))
                        .padding(.horizontal, 16)
                        .padding(.bottom, 24)
                    }
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: backButton)
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .background(.ypWhite)
            } else {
                ServerErrorView()
            }
        }
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
