import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBAction func convertHankaku(_ sender: Any) {
        convert(target: textView.text)
    }
    
    func convert(target:String){
        textView.text = textView.text.replacingOccurrences(of: "ア", with: "ｱ")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

