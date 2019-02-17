//
//  ViewController.swift
//  labelShimmer
//
//  Created by Pushkar Deshmukh on 17/02/19.
//  Copyright © 2019 Pushkar Deshmukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.white
        
        let darkTextLabel = UILabel()
        darkTextLabel.text = "Animation"
        darkTextLabel.textColor = UIColor(white: 1, alpha: 0.2)
        darkTextLabel.font = UIFont.systemFont(ofSize: 80)
        darkTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        darkTextLabel.textAlignment = .center
        view.addSubview(darkTextLabel)
        
        let shinyTextLabel = UILabel()
        shinyTextLabel.text = "Animation"
        shinyTextLabel.textColor = .white
        shinyTextLabel.font = UIFont.systemFont(ofSize: 80)
        shinyTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        shinyTextLabel.textAlignment = .center
        view.addSubview(shinyTextLabel)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = shinyTextLabel.frame
        
        let angle = 60 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        shinyTextLabel.layer.mask = gradientLayer
        
        // animation
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity
        animation.duration = 2
        
        gradientLayer.add(animation, forKey: "doesnt matter")
        
        let openSkeletonLoaderButton = UIButton()
        openSkeletonLoaderButton.setTitle("Open Loader", for: .normal)
        openSkeletonLoaderButton.addTarget(self, action: #selector(skeletonLoaderTapped(_:)), for: .touchUpInside)
        
        openSkeletonLoaderButton.frame = CGRect(x: 0, y: view.frame.height - 100, width: view.frame.width - 100, height: 50)
        openSkeletonLoaderButton.center.x = view.center.x
        view.addSubview(openSkeletonLoaderButton)
    }
    
    @objc func skeletonLoaderTapped(_ sender: UIButton) {
        let skeletonVC = SkeletonLoaderVC()
        
//        let navControl = UINavigationController(rootViewController: skeletonVC)
//        self.navigationController?.pushViewController(navControl, animated: true)
        self.present(skeletonVC, animated: true)
    }
}

