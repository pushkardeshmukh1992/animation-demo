//
//  SkeletonLoaderVC.swift
//  labelShimmer
//
//  Created by Pushkar Deshmukh on 17/02/19.
//  Copyright © 2019 Pushkar Deshmukh. All rights reserved.
//

import UIKit

class SkeletonLoaderVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
        let defaultView = UIView()
        defaultView.frame = CGRect(x: 16, y: 30, width: view.frame.width - 32, height: 400)
        defaultView.backgroundColor = UIColor(white: 0, alpha: 0.1)

        let shinyView = UIView()
        shinyView.frame = CGRect(x: 16, y: 30, width: view.frame.width - 32, height: 400)
        shinyView.backgroundColor = UIColor(white: 0, alpha: 0.2)

        view.addSubview(defaultView)
        view.addSubview(shinyView)

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor, UIColor.clear.cgColor,
            UIColor.black.cgColor, UIColor.black.cgColor,
            UIColor.clear.cgColor, UIColor.clear.cgColor
        ]
        
        gradientLayer.locations = [0, 0.2, 0.4, 0.6, 0.8, 1]
        gradientLayer.frame = shinyView.frame

        let angle = 90 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)

        shinyView.layer.mask = gradientLayer

        gradientLayer.transform = CATransform3DConcat(gradientLayer.transform, CATransform3DMakeScale(2, 2, 0))
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.fromValue = -1.5 * view.frame.width
        animation.toValue = 1.5 * view.frame.width
        animation.repeatCount = Float.infinity
        animation.duration = 2

        gradientLayer.add(animation, forKey: "animationn")
        
        
        let openSkeletonLoaderButton = UIButton()
        openSkeletonLoaderButton.setTitle("Open Label Animation", for: .normal)
        openSkeletonLoaderButton.addTarget(self, action: #selector(skeletonLoaderTapped(_:)), for: .touchUpInside)
        openSkeletonLoaderButton.backgroundColor = UIColor.red
        
        openSkeletonLoaderButton.frame = CGRect(x: 0, y: view.frame.height - 100, width: view.frame.width - 100, height: 50)
        openSkeletonLoaderButton.center.x = view.center.x
        view.addSubview(openSkeletonLoaderButton)

    }
    
    @objc func skeletonLoaderTapped(_ sender: UIButton) {
        let vc = ViewController()
        
//        let navControl = UINavigationController(rootViewController: vc)
//        self.navigationController?.pushViewController(navControl, animated: true)
        self.present(vc, animated: true)
    }
    
}
