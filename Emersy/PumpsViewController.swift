import UIKit
import MapKit

class PumpsViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    var annotations = [MKAnnotation]()

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
            return nil
        }

        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "reuseIdentifier")
        switch annotations.count {
        case 1:
            annotationView.pinTintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        case 2:
            annotationView.pinTintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        default:
            annotationView.pinTintColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        }
        return annotationView
    }
}
