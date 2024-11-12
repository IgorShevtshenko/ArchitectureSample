import Combine

final class SamplePresenter: Presenter<SampleState, SampleAction> {
    
    private let getRandomNumber: () -> Int
    
    private let events = PassthroughSubject<SampleEvent, Never>()
    
    init(
        getRandomNumber: @escaping () -> Int,
        reducer: @escaping (State, SampleEvent) -> State
    ) {
        self.getRandomNumber = getRandomNumber
        super.init(
            initial: .init(),
            dataEvents: events,
            reducer: reducer
        )
    }
    
    @MainActor
    override func send(_ action: Action) async {
        switch action {
        case .increase:
            events.send(.didStartLoading)
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            let newNumber = getRandomNumber()
            events.send(.didChangeNumber(state.count + newNumber))
            events.send(.didFinishLoading)
        }
    }
}
