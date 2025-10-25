//
//  ChooseCityRowView.swift
//  Travel Shedule
//
//  Created by Александр Клопков on 22.10.2025.
//

import SwiftUI

struct ChooseCityRowView: View {
    let title: String
        
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.ypBlack) // Черная стрелка
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.ypBlack) // Черная стрелка
        }
        .padding(.vertical, 18) // Вертикальный паддинг для удобства тапа
        .contentShape(Rectangle())
    }
}

#Preview {
    ChooseCityRowView(title: "Дно")
}
