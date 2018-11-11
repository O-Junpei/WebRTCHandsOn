import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    private var myTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITextFieldの作成
        myTextField = UITextField()
        
        //大きさと位置の指定
        myTextField.frame = CGRect(x: 50, y: 50, width: 200, height: 50)
        
        // 表示する文字を代入する
        myTextField.text = "myTextField"
        
        // Delegate設定
        myTextField.delegate = self
        
        // 枠を表示する.
        myTextField.borderStyle = UITextBorderStyle.roundedRect
        
        // クリアボタンを追加.
        myTextField.clearButtonMode = .whileEditing
        
        // Viewに追加する
        self.view.addSubview(myTextField)
        
        //ボタンの生成
        let basicButton = UIButton()
        basicButton.frame = CGRect(x: 60, y: view.frame.height * 0.6, width: view.frame.width - 120, height: 40)
        basicButton.backgroundColor = UIColor.gray
        basicButton.addTarget(self, action: #selector(basicButtonClicked(sender:)), for:.touchUpInside)
        basicButton.setTitle("通話開始", for: UIControlState.normal)
        basicButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        self.view.addSubview(basicButton)
    }

    //basicボタンが押されたら呼ばれます
     func basicButtonClicked(sender: UIButton){
        print("basicButtonBtnClicked")
        self.performSegue(withIdentifier: "joinToRoom", sender: nil)
    }
    
    //UITextFieldが編集された前に呼ばれる
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing: \(textField.text!)")
    }
    
    //UITextFieldが編集された後に呼ばれる
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing: \(textField.text!)")
    }
    
    //改行ボタンが押された際に呼ばれる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn \(textField.text!)")
        
        // 改行ボタンが押されたらKeyboardを閉じる処理.
        textField.resignFirstResponder()
        
        return true
    }
}
