import SwiftUI
import Kingfisher

struct CarrierInfoView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var path: [Route]
    let schedule: Schedule
    
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(.ypWhiteUniversal)
                .overlay {
                    KFImage(URL(string: schedule.carrierImage ?? ""))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: .infinity)
                }
                .frame(height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .padding(.bottom, 16)
            
            Text(schedule.carrierName ?? "")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.ypBlack)
                .padding(.bottom, 26)
            
            Text("E-mail")
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.ypBlack)
            
            Text(schedule.carrier.email ?? "Отсутствует")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.ypBlueUniversal)
                .padding(.bottom, 26)
            
            Text("Телефон")
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.ypBlack)
            
            Text(schedule.carrier.telephone ?? "Отсутствует")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.ypBlueUniversal)
            
            Spacer()
            
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .navigationTitle("Информация о перевозчике")
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

//#Preview {
//    CarrierInfoView(schedule: Schedule(
//        carrierName: "ОАО \"РЖД\"",
//        carrierImage: "https://yastat.net/s3/rasp/media/data/company/logo/doss.jpg",
//        date: "22 декабря",
//        hasTransfer: true,
//        departureTime: "19:40",
//        arrivalTime: "20:30",
//        travelTime: 1,
//        carrier: Carrier(email: "yandex@mail.ru", telephone: "+7 (904) 323-12-12")
//    ))
//}
