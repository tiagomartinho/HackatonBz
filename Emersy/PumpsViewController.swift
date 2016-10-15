import UIKit
import MapKit

class PumpsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    var annotations = [MKPointAnnotation]()

    @IBAction func longPressGesture(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let touchPoint = sender.location(in: mapView)
            let newCoordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            let annotation = MKPointAnnotation()
            annotation.coordinate = newCoordinates
            mapView.addAnnotation(annotation)
            annotations.append(annotation)
        }
    }

    @IBAction func undo(_ sender: UIButton) {
        if let last = annotations.last {
            mapView.removeAnnotation(last)
            annotations.removeLast()
        }
    }
}
