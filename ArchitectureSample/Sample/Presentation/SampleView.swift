import SwiftUI

struct SampleView: View {
    
    @ObservedObject private var presenter: Presenter<SampleState, SampleAction>
    
    init(presenter: Presenter<SampleState, SampleAction>) {
        self.presenter = presenter
    }
    
    var body: some View {
        VStack {
            ZStack {
                if presenter.state.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else {
                    Text("Count \(presenter.state.count)")
                        .font(.headline)
                }
            }
            .frame(maxHeight: .infinity)
            .transition(.opacity)
            
            VStack {
                Button("Increase") {
                    presenter.send(.increase)
                }
                .font(.title2)
                .buttonStyle(.borderedProminent)
                .disabled(presenter.state.isLoading)
            }
        }
        .animation(.default, value: presenter.state.isLoading)
    }
}
