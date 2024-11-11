import Testing

final class TestingReducer<State, Event> {
    
    private(set) var events = [Event]()
    
    private let reducer: (State, Event) -> State
    
    init(reducer: @escaping (State, Event) -> State) {
        self.reducer = reducer
    }
    
    func reduce(state: State, event: Event) -> State {
        events.append(event)
        return reducer(state, event)
    }
}
