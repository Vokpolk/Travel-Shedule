import Foundation

struct PreviewStoryModel: Identifiable, Hashable {
    var id = UUID()
    
    let image: String
    let text: String
    
    var isViewed: Bool
}

struct PreviewStoriesModel: Identifiable, Hashable {
    var id = UUID()
    
    var stories: [PreviewStoryModel]
}
