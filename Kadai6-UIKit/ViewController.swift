//
//  ViewController.swift
//  Kadai6-UIKit
//
//  Created by sako0602 on 2023/03/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var randomNumber: UILabel!
    @IBOutlet weak var maxNum: UILabel!
    @IBOutlet weak var minNum: UILabel!
    @IBOutlet weak var slider: UISlider!
    private var sliderAnswer = 0
    private var randomInt = Int.random(in: 0 ... 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maxNum.text = "100"
        minNum.text = "0"
        randomNumber.text = String(randomInt)
    }
    
    @IBAction private func sliderValue(_ sender: UISlider) {
        // 最小値を 0 に変更する
        slider.minimumValue = 0
        // 最大値を 100 に変更する
        slider.maximumValue = 100
        //sliderで取得してきた値をsliderAnswerへ代入する
        sliderAnswer = Int(self.slider.value)
        print(">>>",sliderAnswer)
    }
    
    @IBAction func judgmentButton(_ sender: Any) {
        //sliderの値とrandomLabelの値が一致しているか判定する
        if randomInt == sliderAnswer {
            self.presentedUIArert(message: "当たり")//🟥selfは必要なの？
        } else {
            self.presentedUIArert(message: "ハズレ！\nあなたの値は\(sliderAnswer)です")
        }
    }
    
    private func presentedUIArert(message: String) {
        //アラート内容を作成する
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        //OKボタンのアクションを作成
        let  ok = UIAlertAction(title: "再挑戦", style: .default) { _ in
            self.randomNumber.text = self.getRandomValue()
        }
        //OKボタンの機能を追加
        alert.addAction(ok)
        //Alertを表示
        self.present(alert, animated: true, completion: nil)
       
    }

    private func getRandomValue() -> String {
        //１〜１００のランダムな数字をラベルへ代入
        let randomInt = Int.random(in: 1 ... 100)
        return String(randomInt)
    }

}

