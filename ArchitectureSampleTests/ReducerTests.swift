import Testing
@testable import ArchitectureSample

struct ReducerTests {

    @Test func testReduce() async throws {
        let resultState = SampleReducer.reduce(state: .init(count: 0), event: .didChangeNumber(2))
        #expect(resultState == SampleState(count: 2))
    }
}
