//
//  NewCustomViewController.swift
//  customCheckApp
//
//  Created by 辻大貴 on 2020/06/13.
//  Copyright © 2020 辻大貴. All rights reserved.
//

import UIKit
import Firebase

class NewCustomViewController: UIViewController {
    
    //名前
    @IBOutlet var nameTextField: UITextField!
    //性別
    @IBOutlet var sexTextField: UITextField!
    //年齢
    @IBOutlet var oldTextField: UITextField!
    //最後に来店した日
    @IBOutlet var lastdayTextField: UITextField!
    //登録ボタン
    @IBOutlet var registerButton: UIButton!
    //Firebaseのデータベース
    var databaseRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //データベースのインスタンスを生成
        databaseRef = Database.database().reference()
        
        //最初はボタンを押せない
        registerButton.isEnabled = false
        
        //nameTextField
        nameTextField.addTarget(self, action: #selector(checkAndErrorDisplay(_:)), for: .editingChanged)
        //sexTextField
        sexTextField.addTarget(self, action: #selector(checkAndErrorDisplay(_:)), for: .editingChanged)
        //oldTextField
        oldTextField.addTarget(self, action: #selector(checkAndErrorDisplay(_:)), for: .editingChanged)
        //lastdayTextField
        lastdayTextField.addTarget(self, action: #selector(checkAndErrorDisplay(_:)), for: .editingChanged)
    }
    
    //２文字以上入力しないと登録ボタンを押せない
    @objc func checkAndErrorDisplay(_ textField: UITextField) {
        if nameTextField.text?.count ?? 0 < 2 && sexTextField.text?.count ?? 0 < 1  {
            registerButton.isEnabled = false
       }else {
            registerButton.isEnabled = true
       }
    }   //checkAndError
    
    //登録ボタンを押したら
    @IBAction func sendButtonTapped(_ sender: AnyObject) {
        let data = ["name": nameTextField.text!, "sex": sexTextField.text!, "old": oldTextField.text!, "lastday": lastdayTextField.text!]

        databaseRef.child("user").childByAutoId().setValue(data)
        print("送信しました。")
    }
    //キーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}   //class
