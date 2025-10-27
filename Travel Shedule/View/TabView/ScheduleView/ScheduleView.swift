import SwiftUI

enum Direction {
    case from
    case to
}

struct ScheduleView: View {
    @Binding var path: [Route]
    
    @Binding var viewModel: SourceViewModel
    
    private let height: Double = 128
    var body: some View {
        VStack {
            StoriesView()
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ypBlueUniversal)
                    .frame(height: height)
                
                HStack(spacing: 16) {
                    VStack {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .frame(height: height - 16 * 2)
                            
                            VStack(alignment: .leading, spacing: 25) {
                                Text(viewModel.firstData.code.isEmpty ? "Откуда" : viewModel.firstData.settlementName + " (" + viewModel.firstData.stationName + ")")
                                    .padding(.horizontal, 16)
                                    .foregroundStyle(viewModel.firstData.code.isEmpty ? .gray : .black)
                                    .onTapGesture {
                                        
                                        path.append(.fromSettlementsListView)
                                    }
                                
                                Text(viewModel.secondData.code.isEmpty ? "Куда" : viewModel.secondData.settlementName + " (" + viewModel.secondData.stationName + ")")
                                    .padding(.horizontal, 16)
                                    .foregroundStyle(viewModel.secondData.code.isEmpty ? .gray : .black)
                                    .onTapGesture {
                                        
                                        path.append(.toSettlementsListView)
                                    }
                            }
                        }
                    }
                    .cornerRadius(20)
                    .frame(height: 96)
                    .padding(.leading, 16)
                    
                    Button {
                        swapScheduleDirection()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.ypBlueUniversal)
                            .frame(width: 36, height: 36)
                            .background(Circle().fill(Color.white))
                            .padding(.trailing, 16)
                    }
                }
                
            }
            .frame(height: height)
            .padding(.horizontal, 16)
            
            if !viewModel.firstData.code.isEmpty && !viewModel.secondData.code.isEmpty {
                Button("Найти") {
                    path.append(.carrierListView)
                }
                .frame(width: 150, height: 60)
                .tint(.white)
                .background(.ypBlueUniversal)
                .clipShape(.rect(cornerRadius: 16))
                .font(.system(size: 17, weight: .bold))
            }
            
            Spacer()
        }
    }
    
    private func swapScheduleDirection() {
        let tempVar = viewModel.firstData
        viewModel.firstData = viewModel.secondData
        viewModel.secondData = tempVar
    }
}
