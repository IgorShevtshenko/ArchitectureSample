import SwiftUI

struct ContentView: View {
    
    @StateObject private var presenter: Presenter<SampleState, SampleAction>
    
    init() {
        _presenter = StateObject(
            wrappedValue: SamplePresenter(
                getRandomNumber: { Int.random(in: (1..<5)) },
                reducer: SampleReducer.reduce
            )
        )
    }
    var body: some View {
        SampleView(presenter: presenter)
    }
}

#Preview {
    ContentView()
}
