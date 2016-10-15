import MapKit

struct PumpsServiceInput {
    let pa: String
    let flowRate: String
    let annotations: [MKAnnotation]

    func serialized() -> [String: Any] {

        var points = [Any]()

        for annotation in annotations {
            let lat = annotation.coordinate.latitude
            let lng = annotation.coordinate.latitude
            let point: [String: Any] = [
                "lat": lat,
                "lng": lng
            ]
            points.append(point)
        }

        let parameters: [String: Any] = [
            "pa": pa,
            "flowRate": flowRate,
            "points" : points
        ]

        return parameters
    }
}
