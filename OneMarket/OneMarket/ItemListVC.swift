import UIKit

class ItemListVC: UITableViewController {
  override func viewDidLoad () {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellId.Item)
  }
  
  override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 30
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CellId.Item)!
    cell.textLabel!.text = "Item #" + String(indexPath.row)
    return cell
  }
  
  @IBAction func add (_ sender: UIBarButtonItem) {
    performSegue(withIdentifier: SegueId.ItemAdd, sender: sender)
  }
}
