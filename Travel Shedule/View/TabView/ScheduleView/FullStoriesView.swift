import SwiftUI
import Combine

struct FullStoriesView: View {
    struct Configuration {
        let timerTickInternal: TimeInterval
        let progressPerTick: CGFloat
        
        init(
            storiesCount: Int,
            secondsPerStory: TimeInterval = 5,
            timerTickInternal: TimeInterval = 0.05
        ) {
            self.timerTickInternal = timerTickInternal
            self.progressPerTick = 1.0 / CGFloat(storiesCount) / secondsPerStory * timerTickInternal
        }
    }
    
    private let configuration: Configuration
    private var currentStory: FullStoryModel {
        fullViewModel.fullStories.stories[index].storiesPack[currentStoryIndex]
    }
    
    private var currentStoryIndex: Int {
        Int(progress * CGFloat(fullViewModel.fullStories.stories[index].storiesPack.count))
    }
    @State private var progress: CGFloat = 0
    @State private var timer: Timer.TimerPublisher
    @State private var cancellable: Cancellable?
    @Environment(\.dismiss) var dismiss
    @Binding var index: Int
    @Binding var previewViewModel: PreviewStoriesViewModel
    @Binding var fullViewModel: FullStoriesViewModel
    
    
    init(index: Binding<Int>,
         previewViewModel: Binding<PreviewStoriesViewModel>,
         fullViewModel: Binding<FullStoriesViewModel>
    ) {
        self._index = index
        self.configuration = Configuration(storiesCount: 2)
        self.timer = Self.createTimer(configuration: configuration)
        self._previewViewModel = previewViewModel
        self._fullViewModel = fullViewModel
        
        print(currentStory.image)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                Color.ypBlackUniversal
                    .ignoresSafeArea()
                Image(fullViewModel.fullStories.stories[index].storiesPack[currentStoryIndex].image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                ProgressView(numberOfSections: 2, progress: progress)
                    .padding(.init(top: 28, leading: 12, bottom: 12, trailing: 12))
                Button("", image: .close) {
                    dismiss()
                }
                .padding(.top, 57)
                .padding(.trailing, 12)
            }
            .onAppear {
                timer = Self.createTimer(configuration: configuration)
                cancellable = timer.connect()
            }
            .onDisappear {
                cancellable?.cancel()
            }
            .onReceive(timer) { _ in
                timerTick()
            }
            .onTapGesture { location in
                if location.x < geometry.size.width / 2 {
                    prevStory()
                    resetTimer()
                } else {
                    nextStory()
                    resetTimer()
                }
            }
        }
    }
    
    private func timerTick() {
        var nextProgress = progress + configuration.progressPerTick
        if nextProgress >= 1 {
            nextProgress = 0
        }
        progress = nextProgress
        setViewedStory()
    }
    
    private func prevStory() {
        let storiesCount = fullViewModel.fullStories.stories[index].storiesPack.count
        let currentStoryIndex = Int(progress * CGFloat(storiesCount))
        let prevStoryIndex = currentStoryIndex - 1 >= 0 ? currentStoryIndex - 1 : 0
        progress = CGFloat(prevStoryIndex) / CGFloat(storiesCount)
        setViewedStory()
    }
    
    private func nextStory() {
        let storiesCount = fullViewModel.fullStories.stories[index].storiesPack.count
        let currentStoryIndex = Int(progress * CGFloat(storiesCount))
        let nextStoryIndex = currentStoryIndex + 1 < storiesCount ? currentStoryIndex + 1 : 0
        progress = CGFloat(nextStoryIndex) / CGFloat(storiesCount)
        setViewedStory()
    }
    
    private func resetTimer() {
        cancellable?.cancel()
        timer = Self.createTimer(configuration: configuration)
        cancellable = timer.connect()
    }
    
    private func setViewedStory() {
        if currentStoryIndex == fullViewModel.fullStories.stories[index].storiesPack.count - 1 {
            previewViewModel.previewStories.stories[index].isViewed = true
        }
    }
    
    private static func createTimer(configuration: Configuration) -> Timer.TimerPublisher {
        Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
}
