import MapKit

struct PumpsServiceInput {

    let outputPressure: String
    let flowRate: String
    let maxInputPressure: String
    let annotations: [MKAnnotation]

    func serialized() -> [String: Any] {

        var points = [Any]()

        for annotation in annotations {
            points.append(annotationToPoint(annotation))
        }

        let parameters: [String: Any] = [
            "OutputPressure": outputPressure,
            "FlowRate": flowRate,
            "MaxInputPressure": maxInputPressure,
            "Points" : points
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
