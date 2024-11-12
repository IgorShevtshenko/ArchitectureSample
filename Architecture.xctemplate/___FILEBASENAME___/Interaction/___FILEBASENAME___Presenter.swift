import Combine

public final class ___FILEBASENAME___: Presenter<___VARIABLE_productName:identifier___State, ___VARIABLE_productName:identifier___Action> {
        
    private let events = PassthroughSubject<___VARIABLE_productName:identifier___Event, Never>()
    
    public init(reducer: @escaping (State, ___VARIABLE_productName:identifier___Event) -> State) {
        super.init(
            initial: .init(),
            dataEvents: events,
            reducer: reducer
        )
    }
    
    @MainActor
    override func send(_ action: Action) async {
        switch action {}
    }
}
