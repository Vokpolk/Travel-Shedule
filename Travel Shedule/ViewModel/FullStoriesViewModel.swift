import Foundation

@Observable final class FullStoriesViewModel {
    var fullStories: FullStoriesModel = FullStoriesModel(
        stories: [
            FullStoryPackModel(storiesPack: [
                FullStoryModel(image: "big11", title: "big11", text: "text", isViewed: false),
                FullStoryModel(image: "big12", title: "big11", text: "text", isViewed: false),
            ]),
            FullStoryPackModel(storiesPack: [
                FullStoryModel(image: "big21", title: "big11", text: "text", isViewed: false),
                FullStoryModel(image: "big22", title: "big11", text: "text", isViewed: false),
            ]),
            FullStoryPackModel(storiesPack: [
                FullStoryModel(image: "big31", title: "big11", text: "text", isViewed: false),
                FullStoryModel(image: "big32", title: "big11", text: "text", isViewed: false),
            ]),
            FullStoryPackModel(storiesPack: [
                FullStoryModel(image: "big41", title: "big11", text: "text", isViewed: false),
                FullStoryModel(image: "big42", title: "big11", text: "text", isViewed: false),
            ]),
            FullStoryPackModel(storiesPack: [
                FullStoryModel(image: "big51", title: "big11", text: "text", isViewed: false),
                FullStoryModel(image: "big52", title: "big11", text: "text", isViewed: false),
            ]),
            FullStoryPackModel(storiesPack: [
                FullStoryModel(image: "big61", title: "big11", text: "text", isViewed: false),
                FullStoryModel(image: "big62", title: "big11", text: "text", isViewed: false),
            ]),
            FullStoryPackModel(storiesPack: [
                FullStoryModel(image: "big71", title: "big11", text: "text", isViewed: false),
                FullStoryModel(image: "big72", title: "big11", text: "text", isViewed: false),
            ]),
            FullStoryPackModel(storiesPack: [
                FullStoryModel(image: "big81", title: "big11", text: "text", isViewed: false),
                FullStoryModel(image: "big82", title: "big11", text: "text", isViewed: false),
            ]),
            FullStoryPackModel(storiesPack: [
                FullStoryModel(image: "big91", title: "big11", text: "text", isViewed: false),
                FullStoryModel(image: "big92", title: "big11", text: "text", isViewed: false),
            ]),
        ]
    )
    
    func setViewed(storyPackIndex: Int, storyIndex: Int) {
        fullStories.stories[storyPackIndex].storiesPack[storyIndex].isViewed = true
    }
    
    func isView(storyPackIndex: Int, storyIndex: Int) -> Bool {
        fullStories.stories[storyPackIndex].storiesPack[storyIndex].isViewed
    }
}
