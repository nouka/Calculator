//
//  ViewController.swift
//  Calculator
//
//  Created by 苗加俊行 on 2015/12/05.
//  Copyright © 2015年 noka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 計算結果を表示
    private var labelResult: UILabel!
    
    // 計算実行ボタン
    private var buttonCalc: UIButton!
    
    // 数字入力ボタン
    private var buttonNumber: UIButton!
    
    // 四則演算ボタン
    private var buttonOperand: UIButton!
    
    // デバイスの幅
    private var deviceWidth: CGFloat!
    
    // デバイスの高さ
    private var deviceHeight: CGFloat!
    
    // ボタンの高さ
    private var buttonWidth: CGFloat!
    
    // ボタンの幅
    private var buttonHeight: CGFloat!
    
    // 左辺の数値
    private var leftValue: Int!
    
    // 右辺の数値
    private var rightValue: Int!
    
    // 演算子
    private var operand: String!

    // 計算結果を表示
    func setResult(number: Int) {
        labelResult = UILabel(frame: CGRectMake(0, 0, deviceWidth, buttonHeight))
        labelResult.layer.position = CGPoint(x: deviceWidth / 2, y: buttonHeight / 2)
        labelResult.backgroundColor = UIColor.grayColor()
        labelResult.textColor = UIColor.whiteColor()
        labelResult.textAlignment = NSTextAlignment.Center
        labelResult.text = String(number)
        self.view.addSubview(labelResult)
    }
    
    // 計算結果を取得
    func getResult() -> Int {
        let result: String = self.labelResult.text!
        let resultInt: Int = Int(result)!
        return resultInt
    }
    
    // 数字ボタンを配置
    func loadButtonNumber(number: Int, top: CGFloat, left: CGFloat) {
        buttonNumber = UIButton(frame: CGRectMake(0, 0, buttonWidth, buttonHeight))
        buttonNumber.backgroundColor = UIColor.grayColor()
        buttonNumber.setTitle(String(number), forState: UIControlState.Normal)
        buttonNumber.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonNumber.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Highlighted)
        buttonNumber.layer.position = CGPoint(x: left, y: top)
        buttonNumber.tag = number
        buttonNumber.addTarget(self, action: "addNumber:", forControlEvents: .TouchUpInside)
        self.view.addSubview(buttonNumber)
    }
    
    // 四則演算ボタンを配置
    func loadButtonOperand(operand: String, top: CGFloat, left: CGFloat) {
        buttonOperand = UIButton(frame: CGRectMake(0, 0, buttonWidth, buttonHeight))
        buttonOperand.backgroundColor = UIColor.grayColor()
        buttonOperand.setTitle(String(operand), forState: UIControlState.Normal)
        buttonOperand.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonOperand.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Highlighted)
        buttonOperand.layer.position = CGPoint(x: left, y: top)
        buttonOperand.addTarget(self, action: "addOperand:", forControlEvents: .TouchUpInside)
        self.view.addSubview(buttonOperand)
    }
    
    // 計算実行ボタンを配置
    func loadButtonCalc(label: String, top: CGFloat, left: CGFloat) {
        buttonCalc = UIButton(frame: CGRectMake(0, 0, buttonWidth, buttonHeight))
        buttonCalc.backgroundColor = UIColor.grayColor()
        buttonCalc.setTitle(label, forState: UIControlState.Normal)
        buttonCalc.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonCalc.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Highlighted)
        buttonCalc.layer.position = CGPoint(x: left, y: top)
        buttonCalc.addTarget(self, action: "calc:", forControlEvents: .TouchUpInside)
        self.view.addSubview(buttonCalc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deviceWidth = self.view.bounds.width
        deviceHeight = self.view.bounds.height
        buttonWidth = deviceWidth / 4
        buttonHeight = deviceHeight / 5
        
        loadButtonNumber(1, top: buttonHeight * 1.5, left: buttonWidth * 0.5)
        loadButtonNumber(2, top: buttonHeight * 1.5, left: buttonWidth * 1.5)
        loadButtonNumber(3, top: buttonHeight * 1.5, left: buttonWidth * 2.5)
        loadButtonNumber(4, top: buttonHeight * 2.5, left: buttonWidth * 0.5)
        loadButtonNumber(5, top: buttonHeight * 2.5, left: buttonWidth * 1.5)
        loadButtonNumber(6, top: buttonHeight * 2.5, left: buttonWidth * 2.5)
        loadButtonNumber(7, top: buttonHeight * 3.5, left: buttonWidth * 0.5)
        loadButtonNumber(8, top: buttonHeight * 3.5, left: buttonWidth * 1.5)
        loadButtonNumber(9, top: buttonHeight * 3.5, left: buttonWidth * 2.5)
        loadButtonNumber(0, top: buttonHeight * 4.5, left: buttonWidth * 0.5)

        loadButtonOperand("+", top: buttonHeight * 1.5, left: buttonWidth * 3.5)
        loadButtonOperand("-", top: buttonHeight * 2.5, left: buttonWidth * 3.5)
        loadButtonOperand("*", top: buttonHeight * 3.5, left: buttonWidth * 3.5)
        loadButtonOperand("/", top: buttonHeight * 4.5, left: buttonWidth * 3.5)
        
        loadButtonCalc("=", top: buttonHeight * 4.5, left: buttonWidth * 2.5)

        setResult(0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 数字ボタンを押した時の挙動
    internal func addNumber(sender: UIButton) {
        let result = getResult()
        let setValue: String = String(result) + String(sender.tag)
        setResult(Int(setValue)!)
    }
    
    // 四則演算ボタンを押した時の挙動
    internal func addOperand(sender: UIButton) {
        operand = sender.currentTitle
        leftValue = getResult()
        setResult(0)
    }
    
    // 計算実行ボタンを押した時の挙動
    internal func calc(sender: UIButton) {
        rightValue = getResult()
        
        var setValue = 0
        switch operand {
            case "+":
                setValue = leftValue + rightValue
                break
            case "-":
                setValue = leftValue - rightValue
                break
            case "*":
                setValue = leftValue * rightValue
                break
            case "/":
                setValue = leftValue / rightValue
                break
            default:
                break
        }
        leftValue = setValue
        setResult(setValue)
    }
}

