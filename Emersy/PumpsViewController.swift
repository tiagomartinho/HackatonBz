import UIKit
import MapKit
import SVProgressHUD

class PumpsViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    var annotations = [MKAnnotation]()

    let locationManager = CLLocationManager()
    var location: CLLocation?
    var mapZoomSet = false

    var pa: String? = "8"
    var flowRate: String? = "800"

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
            addAnnotation(annotation)
//            if annotations.count == 1 {
//                askHydrantInformation()
//            }
        }
    }

    func addAnnotation(_ annotation: MKAnnotation) {
        mapView.addAnnotation(annotation)
        annotations.append(annotation)
    }

    func askHydrantInformation() {
        let alert = UIAlertController(title: "Hydrant Information", message: "Please insert the following info", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) in
            self.undo()
        }))
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action) in
            let pa = alert.textFields?.first?.text ?? ""
            let flowRate = alert.textFields?.last?.text ?? ""
            if pa.isEmpty || flowRate.isEmpty {
                self.askHydrantInformation()
            } else {
                self.pa = pa
                self.flowRate = flowRate
            }
        }))
        alert.addTextField { (textField) in
            textField.placeholder = "Pa"
            textField.keyboardType = .numbersAndPunctuation
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Flow Rate"
            textField.keyboardType = .numbersAndPunctuation
        }
        present(alert, animated: true, completion: nil)
    }

    @IBAction func undo(_ sender: UIButton) {
        undo()
    }

    func undo() {
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

    @IBAction func calculate(_ sender: UIButton) {
        let fire = annotations.remove(at: 1)
        annotations.append(fire)
        let input = PumpsServiceInput(pa: pa ?? "", flowRate: flowRate ?? "", annotations: annotations)
        SVProgressHUD.show()
        PumpsService().send(input: input) { pumps in
            SVProgressHUD.dismiss()
            if let pumps = pumps {
                self.addPumps(pumps: pumps)
            }
        }
    }

    func addPumps(pumps: [Pump]) {
        for pump in pumps {
            addAnnotation(pump)
        }
    }
}
