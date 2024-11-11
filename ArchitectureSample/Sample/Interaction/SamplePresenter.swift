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
    
    override func send(_ action: SampleAction) async {
        switch action {
        case .increase:
            let newNumber = getRandomNumber()
            events.send(.didChangeNumber(state.count + newNumber))
        case .decrease:
            let newNumber = getRandomNumber()
            events.send(.didChangeNumber(state.count - newNumber))
        }
    }
}
