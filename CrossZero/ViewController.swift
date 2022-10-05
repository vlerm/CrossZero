//
//  ViewController.swift
//  CrossZero
//
//  Created by Вадим Лавор on 5.10.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    
    var crossInputs: [Int] = []
    var zeroInputs: [Int] = []
    var isZeroTurn: Bool = true
    var activeButtons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGradientBackground(view: self.view, colorTop: UIColor(red: 210/255, green: 109/255, blue: 180/255, alpha: 1).cgColor, colorBottom: UIColor(red: 52/255, green: 148/255, blue: 230/255, alpha: 1).cgColor)
    }
    
    @IBAction func setUserInputButtonClicked(_ sender: UIButton) {
        activeButtons.append(sender)
        addInput(sender: sender)
    }
    
    @IBAction func restartGameButtonClicked(_ sender: Any) {
        crossInputs = []
        zeroInputs = []
        isZeroTurn = true
        activeButtons.forEach {
            $0.setBackgroundImage(UIImage(), for: .normal)
            $0.isEnabled = true
            resultLabel.text = "Start game"
        }
        activeButtons = []
    }
    
    func addInput(sender: UIButton) {
        if isZeroTurn {
            zeroInputs.append(sender.tag)
            sender.setBackgroundImage(UIImage(named: "zero"), for: .normal)
            isZeroTurn.toggle()
            Player.zero(playerInput: zeroInputs).isWinner() ? (resultLabel.text = "Zero has won") : (resultLabel.text = "Zero turn")
        } else {
            crossInputs.append(sender.tag)
            sender.setBackgroundImage(UIImage(named: "cross"), for: .normal)
            isZeroTurn.toggle()
            Player.cross(playerInput: crossInputs).isWinner() ? (resultLabel.text = "Cross has won") : (resultLabel.text = "Circle turn")
        }
        sender.isEnabled = false
    }
    
    func setGradientBackground(view: UIView, colorTop: CGColor = UIColor(red: 29.0/255.0, green: 34.0/255.0, blue:234.0/255.0, alpha: 1.0).cgColor, colorBottom: CGColor = UIColor(red: 38.0/255.0, green: 0.0/255.0, blue: 6.0/255.0, alpha: 1.0).cgColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
