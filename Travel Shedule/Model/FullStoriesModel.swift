import Foundation

struct FullStoryModel: Identifiable, Hashable {
    var id = UUID()
    
    let image: String
    let title: String
    let text: String
    
    var isViewed: Bool
}

struct FullStoryPackModel: Identifiable, Hashable {
    var id = UUID()
    
    var storiesPack: [FullStoryModel]
}

struct FullStoriesModel: Identifiable, Hashable {
    var id = UUID()
    
    var stories: [FullStoryPackModel]
}
