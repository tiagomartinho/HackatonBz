import CoreLocation
import MapKit

extension Pump: MKAnnotation {

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }

    var title: String? { return "In \(inputPressure.format()) bar, Out \(outputPressure.format()) bar, FlowRate \(flowRate)" }

    var subtitle: String? {
        let distanceBeforeS = "Distance before: \(distanceBefore.format()) m"
        let tubesBeforeS = "Tubes before: \(tubesBefore)"
        return distanceBeforeS + ", " + tubesBeforeS
    }
}
