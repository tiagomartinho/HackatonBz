import UIKit

class UsersTableViewController: UITableViewController {

    var users: [String]? {
        didSet {
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let users = users {
            cell.textLabel?.text = users[indexPath.row]
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
}
