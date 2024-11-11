import SwiftUI
import Combine

open class Presenter<State, Action>: ObservableObject {
    
    public typealias State = State
    public typealias Action = Action
    
    @Published public private(set) var state: State

    private var cancellables = Set<AnyCancellable>()

    public init<Event, EventPublisher: Publisher>(
        initial: State,
        dataEvents: EventPublisher,
        reducer: @escaping (State, Event) -> State
    ) where EventPublisher.Output == Event, EventPublisher.Failure == Never {
        state = initial
        dataEvents
            .scan(initial, reducer)
            .assign(to: &$state)
    }

    public init(constantState: State) {
        state = constantState
    }
    
    func send(_ action: Action) async {}
}

extension Presenter {
    
    @discardableResult
    func send(_ action: Action) -> Task<Void, Never> {
        Task {
            await send(action)
        }
    }
}
