//
//  StoriesView.swift
//  Travel Shedule
//
//  Created by Александр Клопков on 20.10.2025.
//

import SwiftUI

struct StoriesView: View {
    private let stories: [StoriesCellView] = [
        StoriesCellView(),
        StoriesCellView(),
        StoriesCellView(),
        StoriesCellView(),
        StoriesCellView(),
    ]
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible())], alignment: .center, spacing: 12) {
                ForEach(0..<5) { story in
                    stories[story]
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: 188)
    }
}

#Preview {
    StoriesView()
}
