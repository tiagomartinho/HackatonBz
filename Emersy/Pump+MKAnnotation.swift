import CoreLocation
import MapKit

extension Pump: MKAnnotation {

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }

    var title: String? { return "Input Pressure: \(inputPressure.format()) bar" }

    var subtitle: String? {
        let tubesBeforeS = "Tubes before: \(tubesBefore)"
        let elevationS = "Elevation: \(elevation.format()) m"
        return tubesBeforeS + ", " + elevationS
    }
}
