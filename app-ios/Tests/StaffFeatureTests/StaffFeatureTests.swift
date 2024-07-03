import XCTest
import ComposableArchitecture
@testable import StaffFeature

final class StaffFeatureTests: XCTestCase {

    @MainActor
    func testExample() async throws {
        let store = TestStore(initialState: StaffReducer.State()) {
            StaffReducer()
        }
        await store.send(.onAppear)
        await store.receive(\.response.success) {
            $0.list = [.init(id: 0, name: "testValue", icon: .init(string: "https://avatars.githubusercontent.com/u/10727543?s=200&v=4")!, github: .init(string: "https://2024.droidkaigi.jp/")!)]
        }
    }

}