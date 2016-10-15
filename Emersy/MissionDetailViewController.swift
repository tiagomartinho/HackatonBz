import UIKit

class MissionDetailViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var userActions: UIStackView!
    @IBOutlet weak var userStatus: UILabel!

    var usersTableViewController: UsersTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableViewController = storyboard?.instantiateViewController(withIdentifier: "UsersTableViewController") as? UsersTableViewController
        self.addChildViewController(usersTableViewController!)
        containerView.addSubview(usersTableViewController!.view)
        usersTableViewController!.view.frame = containerView.bounds
        usersTableViewController!.didMove(toParentViewController: self)
        usersTableViewController?.users = ["Tiago", "Juste", "John"]
    }

    @IBAction func usersStatesChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            usersTableViewController?.users = ["Tiago", "Juste", "John"]
        case 1:
            usersTableViewController?.users = ["Martinho"]
        case 2:
            usersTableViewController?.users = ["Doe"]
        default:
            break
        }
    }

    @IBAction func accept(_ sender: AnyObject) {
        hidesUserActions()
    }

    @IBAction func refuse(_ sender: AnyObject) {
        hidesUserActions()
    }

    func hidesUserActions() {
        userActions.isHidden = true
        userStatus.isHidden = false
    }
}
