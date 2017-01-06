import CoreLocation
import MapKit

extension Distributor: MKAnnotation {

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }

    var title: String? { return "Pressure: \(pressure.format()) bar" }

    var subtitle: String? {
        let tubesBeforeS = "Tubes before: \(tubesBefore)"
        let elevationS = "Elevation: \(elevation.format()) m"
        return tubesBeforeS + ", " + elevationS
    }
}
