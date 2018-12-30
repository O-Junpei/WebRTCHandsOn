import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    private var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.width
        let height = view.frame.height
        view.backgroundColor = .white
        
        // UITextFieldの作成
        textField = UITextField()
        textField.frame.size = CGSize(width: 260, height: 60)
        textField.center.x = width / 2
        textField.center.y = height / 2 - 60
        textField.delegate = self
        textField.textAlignment = .center
        textField.placeholder = "room name"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .alphabet
        view.addSubview(textField)
        
        //ボタンの生成
        let basicButton = UIButton()
        basicButton.frame.size = CGSize(width: 260, height: 60)
        basicButton.backgroundColor = UIColor.lightGray
        basicButton.center.x = width / 2
        basicButton.center.y = height / 2 + 60
        basicButton.addTarget(self, action: #selector(taped(sender:)), for:.touchUpInside)
        basicButton.setTitle("join room", for: UIControl.State.normal)
        basicButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.addSubview(basicButton)
    }

    //MARK: Button Action
     @objc func taped(sender: UIButton){
        var title:String!
        let text = textField.text!
        if text.isEmpty {
            title = "Input room name"
        } else if text.utf8.count < 4 {
            title = "Room name must be at least 4 letters"
        }
        
        if let title = title {
            let alert: UIAlertController = UIAlertController(title: title, message: "", preferredStyle:  UIAlertController.Style.alert)
            let cancelAction: UIAlertAction = UIAlertAction(title: "close", style: UIAlertAction.Style.cancel, handler:nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
            return
        }
    
        let vc = ChatViewController(uri: "wss://simple-video-chat.work/socket/",roomName: text)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: TextView Delegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
