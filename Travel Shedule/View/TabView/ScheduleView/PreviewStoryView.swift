import SwiftUI

struct PreviewStoryView: View {
    @Binding var viewModel: PreviewStoriesViewModel
    let index: Int
    let imageHeight: Double = 140
    let imageWidth: Double = 92
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if viewModel.previewStories.stories[index].isViewed {
                Image(viewModel.previewStories.stories[index].image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .opacity(0.5)
            } else {
                Image(viewModel.previewStories.stories[index].image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay {
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(.ypBlueUniversal, lineWidth: 4)
                            .padding(2)
                    }
            }
            Text(viewModel.previewStories.stories[index].text)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.white)
                .frame(width: 86, height: 45)
                .padding()
        }
        .frame(width: imageWidth, height: imageHeight)
    }
}
