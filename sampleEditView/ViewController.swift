//
//  ViewController.swift
//  sampleEditView
//
//  Created by Eriko Ichinohe on 2017/09/26.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit

//テキストフィールドのプロトコルを指定
class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate{

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
        
        //DatePickerを日付モードに設定
        myDatePicker.datePickerMode = UIDatePickerMode.date
        //日付の選択が変更されたら、発動するイベントを設定
        myDatePicker.addTarget(self, action: #selector(showDateSelected(sender:)), for: .valueChanged)
        
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
        
        // イベント追加 ボタンが押されたらcloseBaseViewを実行
        closeDButton.addTarget(self, action: #selector(closeBaseView), for: .touchUpInside)
        
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
    
    //入力開始(textField)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        print("textFieldShouldBeginEditing")
        print(textField.tag)
        
        switch textField.tag {
        case 1:
            //タイトル
            return true
        case 2:
            //日付
            
            //baseViewの表示（下に隠しておくところから見える場所にもってくる）
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                self.baseView.frame.origin.y = self.view.frame.size.height - 250
            
            })
            return false
        default:
            return true
        }
        
        
    }
    
    //入力開始(textView)
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        //form全体を上げるアニメーション
        UIView.animate(withDuration: 0.2, animations: {() -> Void in
            self.formView.frame.origin.y =  self.formView.frame.origin.y - 250
        })
        return true
    }
    
    //キーボードを閉じる
    func closeKeyboard(_ sender: UIButton){
        
        //タイトルの編集で表示されたキーボードを閉じる
        myTitle.resignFirstResponder()
    }

    //baseViewを隠す
    func closeBaseView(){
        UIView.animate(withDuration: 0.5, animations: {() -> Void in
            self.baseView.frame.origin.y = self.view.frame.size.height
        })
    }
    
    //DatePickerで日付を選択した時、日付のTextFieldに値を表示
    func showDateSelected(sender: UIDatePicker){
    
        //フォーマット設定（文字列に変換）
        let df = DateFormatter()
        df.dateFormat = "yyyy / MM / dd"
        
        //選択された日付を日付型から文字列型へ変換
        let strSelectedDate = df.string(from: sender.date)
        
        //TextFieldに変換した文字列を表示
        myDate.text = strSelectedDate
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

