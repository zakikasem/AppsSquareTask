//
//  OrderDetailsViewController.swift
//  AppsSquareTask
//
//  Created by Zaki on 02/07/2022.
//

import UIKit
import GMStepper

class OrderDetailsViewController: UIViewController {
    @IBOutlet weak var stepper: GMStepper!
    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var addToCartBtt: UIButton!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var prooductCateogry: UILabel!
    
    var strd:UIImage!
    var name : String!
    var cateogry : String!

    override func viewDidLoad() {
        super.viewDidLoad()

        stepper.addTarget(self, action: #selector(OrderDetailsViewController.stepperValueChanged), for: .valueChanged)
        roundedBttnWithShadow(Bttn: addToCartBtt)
        orderImage.image = strd
        productName.text = name
        prooductCateogry.text = cateogry
    }

    @objc func stepperValueChanged(stepper: GMStepper) {
        print(stepper.value)
    }
    @IBAction func addToCartBttn(_ sender: Any) {
    }
    
    func roundedBttnWithShadow(Bttn: UIButton) {
            Bttn.layer.cornerRadius = Bttn.frame.size.height/4
            Bttn.layer.shadowColor = UIColor.black.cgColor
            Bttn.layer.shadowRadius = 2
            Bttn.layer.shadowOpacity = 0.5
            Bttn.layer.shadowOffset = CGSize(width: 0.0 , height: 2.0)
        }
}
