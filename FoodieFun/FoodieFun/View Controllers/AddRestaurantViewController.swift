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
    @IBOutlet weak var restaurantHourOpensTextField: UITextField!
    @IBOutlet weak var restaurantHourClosesTextField: UITextField!
    @IBOutlet weak var cuisineTextField: UITextField!
    @IBOutlet weak var foodRatingTextField: UITextField!
    @IBOutlet weak var drinksRatingTextField: UITextField!
    @IBOutlet weak var serviceRatingTextField: UITextField!
    @IBOutlet weak var cleanlinessRatingTextField: UITextField!
    @IBOutlet weak var decorRatingTextField: UITextField!
    @IBOutlet weak var restaurantPhotoImageView: UIImageView!
    @IBOutlet weak var restaurantReviewTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPhotoButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func saveRestaurantButtonTapped(_ sender: UIButton) {
        guard let name = restaurantNameTextField.text,
            !name.isEmpty,
            let address = restaurantAddressTextView.text,
            !address.isEmpty,
            let opens = restaurantHourOpensTextField.text,
            !opens.isEmpty,
            let closes = restaurantHourClosesTextField.text,
            !closes.isEmpty,
            let cuisine = cuisineTextField.text,
            !cuisine.isEmpty,
            let foodRating = foodRatingTextField.text,
            !foodRating.isEmpty,
            let drinksRating = drinksRatingTextField.text,
            !drinksRating.isEmpty,
            let serviceRating = serviceRatingTextField.text,
            !serviceRating.isEmpty,
            let cleanlinessRating = cleanlinessRatingTextField.text,
            !cleanlinessRating.isEmpty,
            let decorRating = decorRatingTextField.text,
            !decorRating.isEmpty,
            let reviewText = restaurantReviewTextView.text,
            !reviewText.isEmpty else {
                let alert = UIAlertController(title: "Incomplete!", message: "Please fill out all the required text fields", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
                return
        }
        
        let restaurant = Restaurant(id: nil, userID: NetworkController.shared.user?.id, name: name, location: address, hours: "\(opens) - \(closes)", image: nil, cuisine: cuisine, reviews: [])
        
        NetworkController.shared.postNewRestaurant(restaurant: restaurant)
        
        self.dismiss(animated: true, completion: nil)
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
