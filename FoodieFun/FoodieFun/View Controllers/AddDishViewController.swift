//
//  AddDishViewController.swift
//  FoodieFun
//
//  Created by Alex Shillingford on 1/7/20.
//  Copyright © 2020 Alex Shillingford. All rights reserved.
//

import UIKit

class AddDishViewController: UIViewController {
    
    @IBOutlet weak var dishNameTextField: UITextField!
    @IBOutlet weak var restaurantTextField: UITextField!
    @IBOutlet weak var dishCuisineTextField: UITextField!
    @IBOutlet weak var addDishPhotoImageView: UIImageView!
    @IBOutlet weak var tasteStarRatingView: UIView!
    @IBOutlet weak var appearanceStarRatingView: UIView!
    @IBOutlet weak var priceStarRatingView: UIView!
    @IBOutlet weak var dishReviewTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addDishPhotoButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func saveDishButtonTapped(_ sender: UIButton) {
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
