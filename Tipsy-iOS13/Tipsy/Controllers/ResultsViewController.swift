
import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var valuePerPerson: Float = 0.0
    var totalPeople: Int = 0
    var tipPercentage: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalLabel.text = String(valuePerPerson)
        let one = Int(tipPercentage * 100)
//        print(one)
        let string = "Split between " + String(totalPeople) + ", with " + String(one) + "% tip"
//        print(string)
        settingsLabel.text = string
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
