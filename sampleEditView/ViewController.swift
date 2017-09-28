//
//  ViewController.swift
//  sampleEditView
//
//  Created by Eriko Ichinohe on 2017/09/26.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit

//テキストフィールドのプロトコルを指定
class ViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var formView: UIView!
    
    @IBOutlet weak var myTitle: UITextField!
    
    @IBOutlet weak var myDate: UITextField!
    
    @IBOutlet weak var myContents: UITextView!
    
    //datePickerが乗るView（下に隠しておく）
    let baseView:UIView = UIView(frame: CGRect(x: 0, y: 720, width: 250, height: 250))
    
    //載せるdatePicker
    let myDatePicker:UIDatePicker = UIDatePicker(frame: CGRect(x: 10, y: 20, width: 300, height: 220))
    
    //baseViewを閉じるためのボタン
    let closeDButton:UIButton = UIButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-----------------------------------
        
        // baseViewにdatePickerを配置
        baseView.addSubview(myDatePicker)
        
        // baseViewにボタンを配置（右上）
        // self.view.frame.width 今動いているデバイスと同じ横幅
        closeDButton.frame.origin.x = self.view.frame.width - 60
        closeDButton.frame.origin.y = 5
        closeDButton.frame.size.width = 50
        closeDButton.frame.size.height = 20
        
        // ボタンにタイトルを設定
        closeDButton.setTitle("Close", for: .normal)
        baseView.addSubview(closeDButton)
        
        // baseViewを下にピッタリ配置、動作しているデバイスと横幅を同じする
        baseView.frame.origin = CGPoint(x:0,y:self.view.frame.size.height)
        baseView.frame.size = CGSize(width: self.view.frame.width, height: 250)
        
        // baseViewの背景色を設定
        baseView.backgroundColor = UIColor.gray
        
        // baseViewをViewに追加
        self.view.addSubview(baseView)
        
        //-----------------------------------
        
        //アクセサリビュー用のViewを作成
        let upView = UIView()
        upView.frame.size.height = 60
        upView.backgroundColor = UIColor.lightGray
        
        //閉じるボタンを作成
        // self.view.bounds.size.width : 今実行されてるデバイスの横幅
        let closeButton = UIButton(frame: CGRect(x: self.view.bounds.size.width - 70, y: 0, width: 70, height: 50))
        closeButton.setTitle("閉じる", for: .normal)
        //タップされたらcloseKeyboardを呼び出す
        closeButton.addTarget(self, action: #selector(closeKeyboard(_:)), for: .touchUpInside)
        
        //ビューに閉じるボタンを追加
        upView.addSubview(closeButton)
        
        //タイトルを編集するためのキーボードのアクセサリービューに設定する
        myTitle.inputAccessoryView = upView
        
    }
    
    //入力開始
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        print("textFieldShouldBeginEditing")
        print(textField.tag)
        
        switch textField.tag {
        case 1:
            //タイトル
            return true
        case 2:
            //日付
            return false
        default:
            return true
        }
        
        
    }
    
    //キーボードを閉じる
    func closeKeyboard(_ sender: UIButton){
        
        //タイトルの編集で表示されたキーボードを閉じる
        myTitle.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

