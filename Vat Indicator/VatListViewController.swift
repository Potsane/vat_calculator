//
//  VatListViewController.swift
//  Vat Indicator
//
//  Created by DVT on 2018/05/16.
//  Copyright © 2018 dvt. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class VatListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let url = "https://jsonvat.com/"
    
    let locationName = ["Thaba-tseka", "Thbana ntlenyana", "Likhakeng - Kae kae"]
    
    let locationDescription = ["It is very nice here, blah blah blah blah blah blah blah he he hehe",
                               "It is very nice here as well, blah blah blah blah blah blah blah he he hehe",
                               "It is very nice here hape le hgape, blah blah blah blah blah blah blah he he hehe"]
    
    let locationImage = [UIImage(named : "hawaiiResort"), UIImage(named : "mountainExpedition"), UIImage(named : "scubaDiving")]

    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getWeather(){
        Alamofire.request(url, method : HTTPMethod.get).responseJSON{
            response in
            if response.result.isSuccess{
                print("Got it")
                
                let vatJSON : JSON = JSON(response.result.value!)
                self.displayVat(vatJSONData : vatJSON)
                //print (vatJSON)
                //self.updateWeatherData(json: weatherJSON)
            }else{
                print("Problems \(response.result.error)")
                //self.cityLabel.text = "Could not connect to server"
            }
        }
    }
    
    func displayVat(vatJSONData : JSON){
       //var vatArray = vatJSONData["rates"].arrayValue
        for obj in vatJSONData["rates"] {
            print(obj)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.locationName.text = locationName[indexPath.row]
        cell.locationImage.image = locationImage[indexPath.row]
        cell.locationDescription.text = locationDescription[indexPath.row]
        
        //This creates the shadows and modifies the cards a little bit
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
                
        return cell
    }
}

