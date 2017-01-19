import UIKit

class DebugVC: UIViewController {
  @IBOutlet weak var outputLabel:UITextView!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let configValues = UserDefaults.standard.dictionaryRepresentation()
    outputLabel.text = String(describing: configValues)
  }
}
