import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        // Do any additional setup after loading the view, typically from a nib.
        // まずPOSTで送信したい情報をセット。
        let str = "name=taro&pw=tarospw"
        let strData = str.data(using: String.Encoding.utf8)
        
        
        var url = NSURL(string: "http://hoge.com/api.php")
        var request = NSMutableURLRequest(url: url as! URL)
        
        // この下二行を見つけるのに、少々てこずりました。
        request.httpMethod = "POST"
        request.httpBody = strData

        do {
            var data = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: nil)
        } catch {
            // エラー処理
        }
 */
    }


    
    @IBAction func connectButtonAction(_ sender: Any) {
        self.performSegue(withIdentifier: "joinToRoom", sender: nil)
    }
    
}

