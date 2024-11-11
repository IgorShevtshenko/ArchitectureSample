@testable import ArchitectureSample
import Testing

struct ViewTests {
    
    @Test func testView() {
        let view = SampleView(
            presenter: .init(constantState: .init(count: 0))
        )
        // assertSnapshot(view)
    }
}
