import MapKit

struct PumpsServiceInput {
    let pa: String
    let flowRate: String
    let annotations: [MKAnnotation]

    func serialized() -> [String: Any] {

        var points = [Any]()

        let first = annotationToPoint(annotations.first!)
        let last = annotationToPoint(annotations.last!)

        for annotation in annotations {
            points.append(annotationToPoint(annotation))
        }

        points.removeFirst()
        points.removeLast()

        let parameters: [String: Any] = [
            "pa": pa,
            "flowRate": flowRate,
            "points" : points,
            "hydrant" : first,
            "fire" : last
        ]

        return parameters
    }

    func annotationToPoint(_ annotation: MKAnnotation) -> [String: Any] {
        let lat = annotation.coordinate.latitude
        let lng = annotation.coordinate.longitude
        let point: [String: Any] = [
            "lat": lat,
            "lng": lng
        ]
        return point
    }
}
