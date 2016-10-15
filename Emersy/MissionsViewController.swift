import UIKit

class MissionsViewController: UITableViewController {

    let missions = ["Mission 1", "Mission 2", "Mission 3"]

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = missions[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detail = storyboard?.instantiateViewController(withIdentifier: "MissionDetailViewController") {
            detail.title = missions[indexPath.row]
            navigationController?.pushViewController(detail, animated: true)
        }
    }
}
