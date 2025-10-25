//
//  CarrierListView.swift
//  Travel Shedule
//
//  Created by Александр Клопков on 25.10.2025.
//

import SwiftUI

struct CarrierListView: View {
    private var viewModel: SourceViewModel
    
    init(viewModel: SourceViewModel) {
        self.viewModel = viewModel
        viewModel.fetchSchedule(from: viewModel.firstData.code, to: viewModel.secondData.code)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.schedules) { schedule in
                    CarrierCellView(schedule: schedule)
                }
            }
            .listStyle(PlainListStyle())
            .tint(.black)
            Spacer()
        }
    }
}

#Preview {
    CarrierListView(viewModel: SourceViewModel())
}
