import UIKit

class ItemEditVC: UIViewController {
  @IBOutlet weak var nameInput:UITextField!
  @IBOutlet weak var locationInput:UITextField!
  @IBOutlet weak var dateInput:UIDatePicker!
  
  @IBAction func save (_ sender: UIBarButtonItem) {
    navigationController!.popViewController(animated: true)
  }
}
