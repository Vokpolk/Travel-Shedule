import SwiftUI
import Kingfisher

struct CarrierCellView: View {
    let schedule: Schedule
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ypLightGray)
                    .frame(height: 104)
                
                VStack {
                    
                    HStack(alignment: .top) {
                        KFImage(URL(string: schedule.carrierImage ?? ""))
                            .resizable()
                            .frame(width: 38, height: 38)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        VStack(alignment: .leading) {
                            Text(schedule.carrierName ?? "Нет имени")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundStyle(.ypBlackUniversal)
                            if schedule.hasTransfer != nil {
                                Text("С пересадкой")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundStyle(.ypRedUniversal)
                            }
                        }
                        Spacer()
                        
                        Text(schedule.date ?? "Нет даты")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(.ypBlackUniversal)
                    }
                    Spacer()
                    HStack {
                        Text(schedule.departureTime ?? "Нет")
                            .font(.system(size: 17, weight: .regular))
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(.ypGrayUniversal)
                        Text(formatHours(schedule.travelTime ?? 0))
                            .font(.system(size: 12, weight: .regular))
                            .frame(alignment: .center)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(.ypGrayUniversal)
                        Text(schedule.arrivalTime ?? "Нет")
                            .font(.system(size: 17, weight: .regular))
                    }
                    .foregroundStyle(.ypBlackUniversal)
                }
                .padding(14)
            }
            .frame(height: 104)
        }
        .padding(.horizontal, 16)
    }
    
    private func formatHours(_ hours: Int) -> String {
        let absHours = abs(hours)
        
        switch absHours {
        case 1, 21, 31, 41, 51, 61, 71, 81, 91:
            return "\(hours) час"
        case 2, 3, 4, 22, 23, 24, 32, 33, 34, 42, 43, 44, 52, 53, 54:
            return "\(hours) часа"
        default:
            return "\(hours) часов"
        }
    }
}


#Preview {
    CarrierCellView(schedule: Schedule(
        carrierName: "РЖД",
        carrierImage: "https://yastat.net/s3/rasp/media/data/company/logo/doss.jpg",
        date: "22 декабря",
        hasTransfer: true,
        departureTime: "19:40",
        arrivalTime: "20:30",
        travelTime: 1
    ))
}
