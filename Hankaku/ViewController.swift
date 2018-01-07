import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    @IBAction func convertHankaku(_ sender: Any) {
        textView.text = convert(target: textView.text)
    }

    @IBAction func pasteCopied(_ sender: Any) {
        let pasteBoard = UIPasteboard.general

        if let data: Data = pasteBoard.data(forPasteboardType: "public.text"),
            let str = String(data: data, encoding: .utf8),
            let text = textView.text {
            textView.text = text + str
        }
    }

    @IBAction func copyWord(_ sender: Any) {
        let pasteBoard = UIPasteboard.general

        if let data: Data = textView.text.data(using: .utf8) {
            pasteBoard.setData(data, forPasteboardType: "public.text")
        }
    }

    private func convert(target: String) -> String {
        if let after = target.applyingTransform(.hiraganaToKatakana, reverse: false)?
                        .applyingTransform(.fullwidthToHalfwidth, reverse: false) {
            return after
        }
        return target
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
