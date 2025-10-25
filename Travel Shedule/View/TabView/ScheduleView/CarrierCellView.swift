//
//  CarrierCellView.swift
//  Travel Shedule
//
//  Created by Александр Клопков on 25.10.2025.
//

import SwiftUI

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
                        Text(schedule.carrierName ?? "Нет имени")
                        VStack {
                            Text("Name")
                            Text("Пересадка")
                        }
                        Text("Дата")
                    }
                    Text("Время")
                }
            }
        }
        .padding(.horizontal, 16)
    }
}


#Preview {
    CarrierCellView(schedule: Schedule())
}
