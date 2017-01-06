import CoreLocation
import MapKit

extension SourcePump: MKAnnotation {

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }

    var title: String? { return "Output Pressure: \(outputPressure.format()) bar" }

    var subtitle: String? {
        return "FlowRate: \(flowRate.format())"
    }
}
