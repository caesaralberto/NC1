//
//  ViewController.swift
//  CoolSter
//
//  Created by Caesar Alberto Fernandez on 17/05/19.
//  Copyright © 2019 Caesar Alberto Fernandez. All rights reserved.
//

import UIKit

extension UIColor{
    var shadeOrange: UIColor {return UIColor(displayP3Red: 248 / 255, green: 156 / 255, blue: 54 / 255, alpha: 1)}
    var middleOrange: UIColor {return UIColor(displayP3Red: 246 / 255, green: 183 / 255, blue: 92 / 255, alpha: 1)}
    var tintOrange: UIColor {return UIColor(displayP3Red: 249 / 255, green: 217 / 255, blue: 169 / 255, alpha: 1)}
    var roundOneColor: UIColor {return UIColor(displayP3Red: 250 / 255, green: 92 / 255, blue: 100 / 255, alpha: 1)}
}

class ViewController: UIViewController {
    var flag = false
    //set rgb value roundOne
    var redOne: Float = 255/255
    var greenOne: Float = 255/255
    var blueOne: Float = 255/255
 
    //declare label text
    @IBOutlet weak var orderLbl: UILabel!{
        didSet{
            orderLbl.text = "Tap Me"
        }
    }
    
    //declare round view one
    @IBOutlet weak var colorOne: UIView!{
        didSet{
            colorOne.layer.cornerRadius = colorOne.frame.width / 2
            colorOne.layer.backgroundColor = UIColor.init().roundOneColor.cgColor
        }
    }
    
    @IBOutlet weak var backgroundView: UIView!{
        didSet{
            backgroundView.layer.cornerRadius = backgroundView.frame.width / 2
            backgroundView.layer.backgroundColor = UIColor.init().roundOneColor.cgColor
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //gradation color initialization
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.init().shadeOrange.cgColor, UIColor.init().middleOrange.cgColor, UIColor.init().tintOrange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5,y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5,y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    //declare before appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //declare update before appear
        colorOne.isHidden = false
        backgroundView.isHidden = false
        orderLbl.isHidden = false
        orderLbl.alpha = 1
        
        //set view to beginning
        colorOne.transform = .identity
        backgroundView.transform = .identity
        
        //when view one isClicked
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.tap)))
    }
    
    //function round one tap
    @objc func tap(){
        
        //show animation change color shape one
        UIView.animate(withDuration: 2) {
            self.backgroundView.backgroundColor = UIColor(displayP3Red: CGFloat(self.redOne), green: CGFloat(self.greenOne), blue: CGFloat(self.blueOne), alpha: 1)
        }
        
        //show animation change label name
        UIView.animate(withDuration: 1) {
            self.orderLbl.text = "Hold"
        }
        
        //show animation round will moving and scaling
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            
            let scaling = CGAffineTransform(scaleX: 2, y: 2)
            let translating = CGAffineTransform(translationX: -2, y: 80)
            //let x = CGAffineTransform(translationX: -2, y: 160)
            
            self.colorOne.transform = scaling.concatenating(translating)
            self.backgroundView.alpha = 1.0
            self.backgroundView.transform = scaling.concatenating(translating)
            
        }) { (_) in
            //
        }
        
        //after finished round can be touch for other function
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.changeColor))
        tapGesture.minimumPressDuration = 0
        self.backgroundView.addGestureRecognizer(tapGesture)
        //self.colorOne.isUserInteractionEnabled = true
    }
    
    @objc func changeColor(gestureRecognizer: UILongPressGestureRecognizer){
//        let redValue: Float = 250 / 255
//        let greenValue: Float = 92 / 255
//        let blueValue: Float = 100 / 255
//        colorOne.backgroundColor = UIColor(displayP3Red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1)
//        let redReduceValue: Float = 1 / 255
//        let greenReduceValue: Float = 32.6 / 255
//        let blueReduceValue: Float = 31 / 255
//
//        if gestureRecognizer.state == .changed {
//            if self.redOne == redValue || self.greenOne == greenValue || self.blueOne == blueValue {
//
//                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
//
//                    self.colorOne.frame = CGRect(x: -25, y: -25, width: self.view.frame.width + 50, height: self.view.frame.height + 50)
//
//                    self.colorOne.alpha = 0.8
//                    self.orderLbl.isHidden = true
//
//                    self.orderLbl.text = "Congratulation"
//                    self.orderLbl.frame = CGRect(x: 0, y: 190, width: 414, height: 51)
//                    self.orderLbl.font = UIFont.systemFont(ofSize: 42)
//
//                    self.colorOne.bringSubviewToFront(self.orderLbl)
//                    self.orderLbl.isHidden = false
//
//
//                }) { (_) in
//                    if !self.flag{
//                        self.bola()
//                    }
//                }
//            }else{
//                self.redOne -= redReduceValue
//                self.greenOne -= greenReduceValue
//                self.blueOne -= blueReduceValue
//            }
//            self.colorOne.backgroundColor = UIColor(displayP3Red: CGFloat(self.redOne), green: CGFloat(self.greenOne), blue: CGFloat(self.blueOne), alpha: 1)
//        }
        if gestureRecognizer.state == .changed {
            if backgroundView.alpha < 0 {
                UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                    
                    self.colorOne.frame = CGRect(x: -25, y: -25, width: self.view.frame.width + 50, height: self.view.frame.height + 50)
                    
                    self.colorOne.alpha = 0.8
                    self.orderLbl.isHidden = true
                    
                    self.orderLbl.text = "Congratulations"
                    self.orderLbl.frame = CGRect(x: 0, y: 190, width: 414, height: 51)
                    self.orderLbl.font = UIFont.systemFont(ofSize: 42)
                    
                    self.colorOne.bringSubviewToFront(self.orderLbl)
                    self.orderLbl.isHidden = false

                }) { (_) in
                    if !self.flag{
                        self.spawnBall()
                    }
                }
            }
            else {
                UIView.animate(withDuration: 2, delay: 0, options: .showHideTransitionViews, animations: {
                    self.backgroundView.alpha -= 0.05
                }) { (_) in
                    //
                }
            }
        }
    }
    
    func spawnBall (){
        for _ in 1...80 {
            let randomX = Int.random(in: 0...400)
            let randomY = Int.random(in: 300...880)
            let shape = UIView(frame: CGRect(x: randomX, y: randomY, width: 25, height: 25))
            
            let shapeColor = [UIColor(displayP3Red: 233 / 255, green: 235 / 255, blue: 47 / 255, alpha: 1), UIColor(displayP3Red: 81 / 255, green: 180 / 255, blue: 144 / 255, alpha: 1), UIColor(displayP3Red: 46 / 255, green: 94 / 255, blue: 192 / 255, alpha: 1)]
            
            shape.backgroundColor = shapeColor.randomElement()
            shape.layer.cornerRadius = shape.frame.width / 2
            
            UIView.animate(withDuration: 2, delay: 0, options: [.repeat, .autoreverse, .curveLinear, .transitionFlipFromRight, .transitionFlipFromLeft, .transitionCurlUp, .transitionCurlDown, .showHideTransitionViews], animations: {
                shape.frame = CGRect(x: CGFloat.random(in: 0...400), y: CGFloat.random(in: 300...800), width: 25, height: 25)
            }, completion: nil)
            
            self.view.addSubview(shape)
            self.colorOne.bringSubviewToFront(shape)
            flag = true
        }
    }
    
}

