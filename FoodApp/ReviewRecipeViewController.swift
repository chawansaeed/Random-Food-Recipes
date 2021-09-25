//
//  ReviewRecipeViewController.swift
//  FoodApp
//
//  Created by Chawan Saeed on 9/2/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class ReviewRecipeViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        let blurEffect = UIBlurEffect(style:.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect )
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
    }


}
