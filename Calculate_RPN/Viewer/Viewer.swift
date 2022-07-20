
import UIKit

class Viewer: UIViewController {

    var controller: Controller?
    
    required init?(coder: NSCoder) {
        print("i'm viewer object")
        super.init(coder: coder)
        controller = Controller(viewer: self)
    }
    //==============================
    var userTyped = false
    var oper = ""
    var label = ""

    @IBOutlet weak var firstNumber: UILabel!
    //MARK: viewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLabe()
        
        
    }
    //================================================
    
    private func setupLabe() {
        firstNumber.textColor = .white
        firstNumber.font = UIFont(name: "AvenirNext-Bold", size: 32)
    }
    
    //MARK: setupLabel
    //MARK: Logic
    func update(result: String) {
        firstNumber.text = "\(result)"
    }
    
    
    //MARK: clearFunc
    @IBAction func clearFunc(_ sender: UIButton) {
            firstNumber.text = ""
            label = ""
            userTyped = false
        
    }
    //MARK: operationsFunc
    @IBAction func operationsFunc(_ sender: UIButton) {
        oper = sender.titleLabel?.text ?? "error"
        label = " "
        if userTyped {
            if oper == "+/-" {
                print(label)
                label = self.firstNumber.text!
                self.firstNumber.text! = ""
                self.firstNumber.text! += "-\(label)"
                label += self.firstNumber.text!
            } else {
                self.firstNumber.text! = self.firstNumber.text! + " \(oper) "
            }
        }
    }
    //MARK: equalToFunc
    @IBAction func equalToFunc(_ sender: UIButton) {
        if sender.titleLabel?.text == "=" {
            controller?.CalcResult(label: label)
            label = ""
        }
    }
    @IBAction func eq(_ sender: UIButton) {
        print(sender.currentTitle ?? "error")
    }
    //MARK: numbersFunc
    @IBAction func numbersFunc(_ sender: UIButton) {
        let number = sender.titleLabel?.text ?? "error"
        
        print(number)
     if userTyped {
         self.firstNumber.text! = self.firstNumber.text! + "\(number)"
         label = ""
         label = " \(self.firstNumber.text!)"
     } else {
         self.firstNumber.text = "\(number)"
         userTyped = true
        }
    }
    //MARK: decimalFunc
    @IBAction func decimalFunc(_ sender: UIButton) {
        label = ""
        let decimal = sender.titleLabel?.text ?? "0"
        if userTyped {
            firstNumber.text = firstNumber.text! + "\(decimal)"
            label = firstNumber.text!
            print(label)
        }
        else{
            firstNumber.text = ("0")
        }
    }
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
    
}


