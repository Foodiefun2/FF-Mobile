//
//  RestaurantDetailViewController.swift
//  FoodieFun
//
//  Created by Alex Shillingford on 1/7/20.
//  Copyright © 2020 Alex Shillingford. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    @IBOutlet weak var restaurantDetailImageView: UIImageView!
    @IBOutlet weak var restaurantDetailNameLabel: UILabel!
    @IBOutlet weak var restaurantDetailRatingLabel: UILabel!
    @IBOutlet weak var restaurantDetailCuisineLabel: UILabel!
    @IBOutlet weak var restaurantDetailAddressTextView: UITextView!
    @IBOutlet weak var mondayThursdayHoursLabel: UILabel!
    @IBOutlet weak var fridaySaturdayHoursLabel: UILabel!
    @IBOutlet weak var sundayHoursLabel: UILabel!
    
    var restaurant: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        guard let restaurant = restaurant else { return }
        
        restaurantDetailNameLabel.text = restaurant.name
        restaurantDetailCuisineLabel.text = restaurant.cuisine
        restaurantDetailAddressTextView.text = restaurant.location
        
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
