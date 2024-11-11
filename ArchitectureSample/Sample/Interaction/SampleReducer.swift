enum SampleReducer {
    
    static func reduce(state: SampleState, event: SampleEvent) -> SampleState {
        var state = state
        switch event {
        case .didChangeNumber(let int):
            state.count = int
        }
        return state
    }
}
