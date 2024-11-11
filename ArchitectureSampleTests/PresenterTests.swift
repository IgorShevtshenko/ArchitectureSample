import Testing
@testable import ArchitectureSample

struct PresenterTests {
    
    private let reducer: TestingReducer<SampleState, SampleEvent>
    private let presenter: SamplePresenter
    
    init() {
        self.reducer = TestingReducer(reducer: SampleReducer.reduce)
        self.presenter = SamplePresenter(
            getRandomNumber: { 1 },
            reducer: reducer.reduce
        )
    }

    @Test func testSend() async throws {
        await presenter.send(.increase)
        #expect(reducer.events == [.didChangeNumber(1)])
    }
}
