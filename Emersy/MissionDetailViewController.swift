import UIKit

class MissionDetailViewController: UITableViewController {

    let users = ["Tiago Martinho", "Juste", "John Doe"]

    var missionName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let missionName = missionName {
            self.title = missionName
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = users[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
}
