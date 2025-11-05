import SwiftUI

struct PreviewStoriesView: View {
    @State private var previewViewModel: PreviewStoriesViewModel = PreviewStoriesViewModel()
    @State private var fullViewModel: FullStoriesViewModel = FullStoriesViewModel()
    @State private var isPresenting = false
    @State private var index: Int = 0
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible())], alignment: .center, spacing: 12) {
                ForEach(0..<previewViewModel.previewStories.stories.count) { index in
                    PreviewStoryView(viewModel: $previewViewModel, index: index)
                        .onTapGesture {
                            self.index = index
                            isPresenting = true
                        }
                        
                }
            }
            .padding(.horizontal)
            .fullScreenCover(isPresented: $isPresenting) {
                FullStoriesView(
                    index: $index,
                    previewViewModel: $previewViewModel,
                    fullViewModel: $fullViewModel
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 188)
    }
}

#Preview {
    PreviewStoriesView()
}
