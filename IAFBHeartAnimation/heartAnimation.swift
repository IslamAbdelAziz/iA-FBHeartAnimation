//
//  heartAnimation.swift
//  tryFBAnimations
//
//  Created by iSlam AbdelAziz on 6/20/18.
//  Copyright © 2018 Lodex-solutions. All rights reserved.
//

import UIKit

public class heartAnimation: NSObject {
    
    public init(masterView: UIView, image: UIImage, numberOfItemsToShow: Int) {
        super.init()
        for _ in 0 ... numberOfItemsToShow {
            generateAnimatedViews(parentView: masterView, image: image)
        }
    }

    func customPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 200, y: 800))
        let randomYShift = 0 + drand48() * 300
        let cp1 = CGPoint(x:  randomYShift, y: -100 )
        path.addLine(to: cp1)
        return path
    }
    
    
    func generateAnimatedViews(parentView: UIView, image:UIImage){
        
        let imageView = UIImageView(image: image)
        let dimention = 40 + drand48() * 75
        imageView.frame = CGRect(x: 0, y: 0, width: dimention, height: dimention)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        imageView.layer.add(animation, forKey: nil)
               
        
        parentView.addSubview(imageView)
    }
    
   
}
