import SwiftUI

struct SampleView: View {
    
    @ObservedObject private var presenter: Presenter<SampleState, SampleAction>
    
    init(presenter: Presenter<SampleState, SampleAction>) {
        self.presenter = presenter
    }
    
    var body: some View {
        VStack {
            Text("Count \(presenter.state.count)")
                .font(.headline)
                .frame(maxHeight: .infinity)
            
            VStack {
                Button("Increase") {
                    presenter.send(.increase)
                }
                .buttonStyle(.borderedProminent)
                
                Button("Decrease") {
                    presenter.send(.decrease)
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}
