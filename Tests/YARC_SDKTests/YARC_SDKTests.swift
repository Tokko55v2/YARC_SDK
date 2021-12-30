@testable import YARC_SDK
import XCTest
import Combine

final class YARC_SDKTests: XCTestCase {
    let module: YarcModuleBuilder = .init()
    var store: Set<AnyCancellable> = .init()
    
    func testGetMostPopularReddits() {
        let asyncExpectation = expectation(description: "getMostPopularReddits")
        
        module.build().getMostPopularReddits()
            .sink(receiveCompletion: { completion in
                if case .finished = completion {
                    asyncExpectation.fulfill()
                }
                
            }, receiveValue: { value in
                print(value)
                XCTAssertNotNil(value)
            })
            .store(in: &store)
        
        self.waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error)
         }
    }

    static var allTests = [("MostPopularReddits", testGetMostPopularReddits)]
}
