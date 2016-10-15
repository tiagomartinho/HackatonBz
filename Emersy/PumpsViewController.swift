import UIKit
import MapKit

class PumpsViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    var annotations = [MKPointAnnotation]()

    let locationManager = CLLocationManager()
    var location: CLLocation?
    var mapZoomSet = false

    override func viewDidLoad() {
        super.viewDidLoad()
        getUserPosition()
        mapView.delegate = self
    }

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

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil;
        }

        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "reuseIdentifier")
        annotationView.pinTintColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        return annotationView
    }
}
