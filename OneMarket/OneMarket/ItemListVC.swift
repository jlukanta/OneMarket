import UIKit

class ItemListVC: UITableViewController {
  let cellIdentifier = "item-cell"
  
  override func viewDidLoad () {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
  }
  
  override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 30
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
    cell.textLabel!.text = "Item #" + String(indexPath.row)
    return cell
  }
}
