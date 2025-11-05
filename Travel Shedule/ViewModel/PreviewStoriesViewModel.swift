import Foundation

@Observable final class PreviewStoriesViewModel {
    var previewStories: PreviewStoriesModel = PreviewStoriesModel(
        stories: [
            PreviewStoryModel(image: "preview1", text: "preview1", isViewed: false),
            PreviewStoryModel(image: "preview2", text: "preview2", isViewed: false),
            PreviewStoryModel(image: "preview3", text: "preview3", isViewed: false),
            PreviewStoryModel(image: "preview4", text: "preview4", isViewed: false),
            PreviewStoryModel(image: "preview5", text: "preview5", isViewed: false),
            PreviewStoryModel(image: "preview6", text: "preview6", isViewed: false),
            PreviewStoryModel(image: "preview7", text: "preview7", isViewed: false),
            PreviewStoryModel(image: "preview8", text: "preview8", isViewed: false),
            PreviewStoryModel(image: "preview9", text: "preview9", isViewed: false)
        ]
    )
    
    func setViewed(storyIndex: Int) {
        previewStories.stories[storyIndex].isViewed = true
    }
    
    func isView(storyIndex: Int) -> Bool {
        previewStories.stories[storyIndex].isViewed
    }
    
    
}
