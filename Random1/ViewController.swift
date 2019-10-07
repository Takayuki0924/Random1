//
//  ViewController.swift
//  Random1
//
//  Created by 長野貴之 on 2019/10/04.
//  Copyright © 2019 takayuki Nagano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //部品の座標
    var PosX: CGFloat = 0
    var PosY: CGFloat = 0
    
    //テキストフィールドの幅と高さ
    var tWidth: CGFloat = 100
    var tHeight: CGFloat = 30
    
    //テキストフィールド
    var Ltextfield: UITextField!
    var Rtextfield: UITextField!
    
    //乱数を表示するラベル
    var RLabel: UILabel!
    
    //乱数実行ボタン
    var RandomBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //タイトルのサイズを定義
        let lWidth: CGFloat = 300
        let lHeight: CGFloat = 50
        
        //タイトルの座標
        PosX = self.view.bounds.width / 2 - lWidth / 2
        PosY = self.view.bounds.height / 8 - lHeight / 2
        
        //Labelを生成
        let TLabel: UILabel = UILabel(frame: CGRect(x: PosX, y: PosY, width: lWidth, height: lHeight))
        
        //文字の色を黒に定義
        TLabel.textColor = UIColor.black
        
        //タイトル名
        TLabel.text = "問題番号をランダム生成"
        
        //テキストを中央に寄せる
        TLabel.textAlignment = NSTextAlignment.center
        
        //テキストの大きさ
        TLabel.font = UIFont.systemFont(ofSize: 25)
        
        //Viewの背景を白にする
        self.view.backgroundColor = UIColor.white
        
        //ViewにLabelを追加
        self.view.addSubview(TLabel)
        
        
        
        //テキストフィールド-leftを配置
        PosX = self.view.bounds.width / 4 - tWidth / 2
        PosY = self.view.bounds.height / 4 - tHeight / 2
        
        //テキストフィールド-leftを作成
        Ltextfield = UITextField(frame: CGRect(x: PosX, y: PosY, width: tWidth, height: tHeight))
        
        //Delegateを自身に設定
        Ltextfield.delegate = self
        
        //枠を表示する
        Ltextfield.borderStyle = .roundedRect
        
        //テキストを右詰めにする
        Ltextfield.textAlignment = NSTextAlignment.right
        
        //Viewに追加する
        self.view.addSubview(Ltextfield)
        
        
        
        //テキストフィールド-rightを配置
        PosX = self.view.bounds.width * 3/4 - tWidth / 2
        PosY = self.view.bounds.height / 4 - tHeight / 2
        
        //テキストフィールド-rightを作成
        Rtextfield = UITextField(frame: CGRect(x: PosX, y: PosY, width: tWidth, height: tHeight))
        
        //Delegateを自身に設定
        Rtextfield.delegate = self
        
        //枠を表示する
        Rtextfield.borderStyle = .roundedRect
        
        //テキストを右寄せにする
        Rtextfield.textAlignment = NSTextAlignment.right
        
        //Viewに追加する
        self.view.addSubview(Rtextfield)
        
        
        
        //値指定ラベルの大きさ
        let Val_Width: CGFloat = 70
        let Val_Height: CGFloat = 30
        
        //最小値ラベル
        //配置座標
        PosX = self.view.bounds.width / 4 - tWidth / 2
        PosY = self.view.bounds.height / 4 - tHeight / 2 - 30
        
        //Labelを作成
        let MinLabel: UILabel = UILabel(frame: CGRect(x: PosX, y: PosY, width: Val_Width, height: Val_Height))
        
        //ラベルに文字を代入
        MinLabel.text = "最小値"
        
        //文字の大きさ
        MinLabel.font = UIFont.systemFont(ofSize: UIFont.labelFontSize)
        
        //文字の色
        MinLabel.textColor = UIColor.black
        
        //テキストを左に寄せる
        MinLabel.textAlignment = NSTextAlignment.left
        
        //Viewに追加
        self.view.addSubview(MinLabel)
        
        //最大値ラベル
        //配置座標
        PosX = self.view.bounds.width * 3/4 - tWidth / 2
        PosY = self.view.bounds.height / 4 - tHeight / 2 - 30
        
        //Labelを作成
        let MaxLabel: UILabel = UILabel(frame: CGRect(x: PosX, y: PosY, width: Val_Width, height: Val_Height))
        
        //ラベルに文字を代入
        MaxLabel.text = "最大値"
        
        //文字の大きさ
        MaxLabel.font = UIFont.systemFont(ofSize: UIFont.labelFontSize)
        
        //文字の色
        MaxLabel.textColor = UIColor.black
        
        //テキストを左に寄せる
        MaxLabel.textAlignment = NSTextAlignment.left
        
        //Viewに追加
        self.view.addSubview(MaxLabel)
        
        
        //乱数ラベルの大きさ
        let RWidth: CGFloat = 300
        let RHeight: CGFloat = 100
        
        //配置座標
        PosX = self.view.bounds.width / 2 - RWidth / 2
        PosY = self.view.bounds.height / 2 - RHeight / 2
        
        //Labelを生成
        RLabel = UILabel(frame: CGRect(x: PosX, y: PosY, width: RWidth, height: RHeight))
        
        //ラベルに文字を代入
        RLabel.text = "0"
        
        //文字の大きさ
        RLabel.font = UIFont.systemFont(ofSize: 50)
        
        //文字の色
        RLabel.textColor = UIColor.black
        
        //テキストを中央寄せにする
        RLabel.textAlignment = NSTextAlignment.center
        
        //Viewに追加
        self.view.addSubview(RLabel)
        
        
        //乱数生成ボタン
        //ボタンの大きさ
        let RBWidth: CGFloat = 130
        let RBHeight: CGFloat = 50
        
        //配置座標
        PosX = self.view.bounds.width / 4 - RBWidth / 2
        PosY = self.view.bounds.height * 3/4
        
        //ボタンを生成
        RandomBtn = UIButton(frame: CGRect(x: PosX, y: PosY, width: RBWidth, height: RBHeight))
        
        //ボタンの枠を丸くする
        RandomBtn.layer.masksToBounds = true
        
        //コーナーの半径を設定する
        RandomBtn.layer.cornerRadius = 20.0
        
        //ボタンの背景色を設定
        RandomBtn.backgroundColor = UIColor.green
        
        //テキストを設定
        RandomBtn.setTitle("乱数生成", for: .normal)
        RandomBtn.setTitleColor(UIColor.white, for: .normal)
        RandomBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        
        //ボタンアクション
        RandomBtn.addTarget(self, action: #selector(ViewController.RandomNumGeneration(sender:)), for: .touchUpInside)
        
        //ボタンをViewに追加
        self.view.addSubview(RandomBtn)
        
        
        //リセットボタン
        //配置座標
        PosX = self.view.bounds.width * 3/4 - RBWidth / 2
        PosY = self.view.bounds.height * 3/4
        
        //ボタンを生成
        let ResetBtn: UIButton = UIButton(frame: CGRect(x: PosX, y: PosY, width: RBWidth, height: RBHeight))
        
        //ボタンの枠を丸くする
        ResetBtn.layer.masksToBounds = true
        
        //コーナーの半径を設定する
        ResetBtn.layer.cornerRadius = 20.0
        
        //ボタンの背景色を設定
        ResetBtn.backgroundColor = UIColor.red
        
        //テキストを設定
        ResetBtn.setTitle("リセット", for: .normal)
        ResetBtn.setTitleColor(UIColor.white, for: .normal)
        ResetBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        
        //ボタンアクション
        ResetBtn.addTarget(self, action: #selector(ViewController.ResetAction(sender:)), for: .touchUpInside)
        
        //ボタンをViewに追加
        self.view.addSubview(ResetBtn)
        
        //乱数生成ボタンを無効にする
        invalidBtn()
        
    }
    //ボタンの無効化
    func invalidBtn() {
        if Ltextfield.text == "" {
            RandomBtn.isEnabled = false
        } else {
            RandomBtn.isEnabled = true
        }
        
        if Rtextfield.text == "" {
            RandomBtn.isEnabled = false
        } else {
            RandomBtn.isEnabled = true
        }
        
    }
    
    //乱数生成ボタンのアクション内容
    @objc func RandomNumGeneration(sender: UIButton) {
        
        //文字列型から整数型に変換
        let MinStr = Ltextfield.text!
        let MinInt = Int(MinStr)!
        
        let MaxStr = Rtextfield.text!
        let MaxInt = Int(MaxStr)!
        
        //最小値から最大値までの範囲での乱数
        let random = Int.random(in: MinInt ... MaxInt)
        
        //乱数表示ラベルに生成した乱数を代入
        let StrRandom = String(random)
        RLabel.text = StrRandom
        
    }
    
    //リセットボタンを押した時
    @objc func ResetAction(sender: UIButton) {
        //テキストフィールドをリセット
        Ltextfield.text = ""
        Rtextfield.text = ""
        
        //乱数ラベルをリセット
        RLabel.text = "0"
        
        //乱数生成ボタンが有効か無効かの判断
        invalidBtn()
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //キーボードの種類を英数字とする
        self.Ltextfield.keyboardType = UIKeyboardType.numberPad
        self.Rtextfield.keyboardType = UIKeyboardType.numberPad
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        //乱数生成ボタンが有効か無効の判断
        invalidBtn()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //ユーザーがキーボード以外の場所をタッチすると、キーボードを閉じる
        if (self.Ltextfield.isFirstResponder){
            self.Ltextfield.resignFirstResponder()
        }
        if (self.Rtextfield.isFirstResponder){
            self.Rtextfield.resignFirstResponder()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

