import XCTest
@testable import Emersy
import MapKit

class EmersyTests: XCTestCase {

    func testSimpleInput() {
        let input = PumpsServiceInput(pa: "8", flowRate: "800", annotations: [MKAnnotation]()).serialized()
        XCTAssert(JSONSerialization.isValidJSONObject(input))
    }
}
