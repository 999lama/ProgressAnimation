//
//  ViewController.swift
//  ProgressViewAnimation
//
//  Created by Lama Albadri on 20/05/2021.
//

import UIKit

class ViewController: UIViewController {

    var timeCounting:Bool = false
    let shape = CAShapeLayer()
    
    @IBOutlet weak var button: UIButton!{
        didSet{
            button.layer.cornerRadius = 20
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let circlePath = UIBezierPath(arcCenter: view.center,
                                      radius: 150,
                                      startAngle: -(.pi / 2),
                                      endAngle: .pi * 2
                                      , clockwise: true)
      
        let trackShape = CAShapeLayer()
        trackShape.path = circlePath.cgPath
        trackShape.lineWidth = 15
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.strokeColor = UIColor.gray.cgColor
        view.layer.addSublayer(trackShape)
        shape.path = circlePath.cgPath
        shape.lineWidth = 15
        shape.strokeColor = UIColor(red: 29/225, green: 12/225, blue: 172/225, alpha: 1.0).cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
     
       
  
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }

    
    @objc func didTapButton(){
       
        // Start Animate
        let animation = CABasicAnimation(keyPath: "strokeEnd")
    
        if (timeCounting){

            
            timeCounting = false

            self.shape.strokeColor = UIColor.blue.cgColor
            
        }else{
            
            
            self.shape.strokeColor = UIColor.blue.cgColor
            timeCounting = true
    
                animation.toValue = 1
                animation.duration = 10
                animation.isRemovedOnCompletion = false
                animation.fillMode = .forwards
                self.shape.add(animation, forKey: "animation")
              
     
        }
   
    }

}

