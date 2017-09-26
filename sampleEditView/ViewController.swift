//
//  ViewController.swift
//  sampleEditView
//
//  Created by Eriko Ichinohe on 2017/09/26.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var formView: UIView!
    
    @IBOutlet weak var myTitle: UITextField!
    
    @IBOutlet weak var myDate: UITextField!
    
    @IBOutlet weak var myContents: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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

