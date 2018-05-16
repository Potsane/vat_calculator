//
//  ViewController.swift
//  Vat Indicator
//
//  Created by DVT on 2018/05/14.
//  Copyright © 2018 dvt. All rights reserved.
//

import UIKit
import paper_onboarding

class DemoScreenViewController: UIViewController {

    //Outlets
    @IBOutlet weak var onboardingObject: OnBoardingViewClass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingObject.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension DemoScreenViewController : PaperOnboardingDataSource{
   
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        
        let firstBackground = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        let secondBackground = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        let thirdBackground = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        let textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let tittleFont = UIFont(name: "HelveticaNeue-Bold", size:18)
        let descriptionFont = UIFont(name : "HelveticaNeue", size: 14)
        
        var firstScereen = OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "illustration"), title: "Beer", description: "Joala ka mpeng", pageIcon: #imageLiteral(resourceName: "active"), color: firstBackground, titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: tittleFont!, descriptionFont: descriptionFont!)
        
        var secondScereen = OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "post-1"), title: "Post", description: "Post li kae", pageIcon: #imageLiteral(resourceName: "active"), color: firstBackground, titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: tittleFont!, descriptionFont: descriptionFont!)
        
        var thirdScereen = OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "card-1"), title: "Card", description: "Madice ka mpeng", pageIcon: #imageLiteral(resourceName: "active"), color: firstBackground, titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: tittleFont!, descriptionFont: descriptionFont!)
        
        return[firstScereen, secondScereen, thirdScereen][index]
        
    }
    
}

