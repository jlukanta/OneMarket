import UIKit

class ItemAddVC: UIViewController {
  @IBOutlet weak var nameInput:UITextField!
  @IBOutlet weak var locationInput:UITextField!
  @IBOutlet weak var dateInput:UIDatePicker!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    nameInput.becomeFirstResponder()
  }
  
  @IBAction func done (_ sender: UIBarButtonItem) {
    navigationController!.popViewController(animated: true)
  }
}
