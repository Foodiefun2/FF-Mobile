//
//  AddRestaurantViewController.swift
//  FoodieFun
//
//  Created by Alex Shillingford on 1/7/20.
//  Copyright © 2020 Alex Shillingford. All rights reserved.
//

import UIKit

class AddRestaurantViewController: UIViewController {
    
    @IBOutlet weak var restaurantNameTextField: UITextField!
    @IBOutlet weak var restaurantAddressTextView: UITextView!
    @IBOutlet weak var mondayThursdayTextField: UITextField!
    @IBOutlet weak var fridaySaturdayTextField: UITextField!
    @IBOutlet weak var sundayTextField: UITextField!
    @IBOutlet weak var restaurantPhotoImageView: UIImageView!
    @IBOutlet weak var foodStarRatingView: UIView!
    @IBOutlet weak var drinksStarRatingView: UIView!
    @IBOutlet weak var serviceStarRatingView: UIView!
    @IBOutlet weak var cleanlinessStarRatingView: UIView!
    @IBOutlet weak var restaurantReviewTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPhotoButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func saveRestaurantButtonTapped(_ sender: UIButton) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
