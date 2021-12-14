
import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPercentage: Float = 0.0
    var valuePerPerson: Float = 0.0
    var splitNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        if (sender.currentTitle == zeroPctButton.currentTitle) {
            tipPercentage = 0.0
        }
        else if (sender.currentTitle == tenPctButton.currentTitle) {
            tipPercentage = 0.1
        }
        else if (sender.currentTitle == twentyPctButton.currentTitle) {
            tipPercentage = 0.2
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatepressed(_ sender: UIButton) {
        let billText: Float = Float(billTextField.text!) ?? 0.0
        splitNumber = Int(splitNumberLabel.text!) ?? 0
        
        let total = (billText + (billText * tipPercentage))
        valuePerPerson = total / Float(splitNumber)
        print(valuePerPerson)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.valuePerPerson = valuePerPerson
            destinationVC.tipPercentage = tipPercentage
            destinationVC.totalPeople = splitNumber
        }
    }
}

