//
//  HomeViewController.swift
//  AppsSquareTask
//
//  Created by Zaki on 03/07/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchTxtField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    
    // If We take data from api we should use instance from View Model
    let viewModel = GeyMyProductsViewModel()
    private var products : [RestaurantProducts] = []
    
    
    
//MARK : This is Custom data
    var imagesArr:[UIImage] = [
            UIImage(named: "Rectangle 1")!,
            UIImage(named: "Rectangle 2")! , UIImage(named: "Rectangle 1")!,
            UIImage(named: "Rectangle 2")!
        ]
    
    var burgerName = ["Cheese Burger" , "big mac" , "margreta" , "zingar"]
    var pizzaNames = ["margretta" , "Super Kranchi" , "Cheese" , "Zingar"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        viewModel.GetMyProducts()
        setUpViewModel()
    }
    
    
    
    //MARK : This is SetUp For ViewModel
    private func setUpViewModel() {
        viewModel.OnMyProductsSucsess = { [weak self] productsArray in
            self?.products = productsArray ?? []
            self?.tableView.reloadData()
        }
        
        viewModel.OnMyProductsFailed = { [weak self] message in
            self?.displayAlertMessage(messageToDisplay: message)
        }
    }
    
    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
    
    
    @IBAction func segmentControl(_ sender: Any) {
        tableView.reloadData()
    }
}


extension HomeViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeCell
        switch segmentControl.selectedSegmentIndex{
            
        case 0 :
            cell.imageCell.image = imagesArr[indexPath.row]
            
            cell.productImage.image = UIImage(named: "burger")
            cell.name.text = burgerName[indexPath.row]
            cell.cateogry.text = "Burger"
            
            //DA Elmafrood Eldata Elly Bteegy Mn El API
            
            //cell.cateogry.text = products[indexPath.row].Cateogry ?? ""
            //cell.name.text = products[indexPath.row].Cateogry ?? ""
        case 1:
            cell.productImage.image = UIImage(named: "piza")
            cell.name.text = pizzaNames[indexPath.row]
            cell.cateogry.text = "pizza"

        case 2:
            cell.imageCell.image = imagesArr[indexPath.row]
        case 3:
            cell.imageCell.image = imagesArr[indexPath.row]        default :
            break
        }
       
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch segmentControl.selectedSegmentIndex{
        case 0 :
            return imagesArr.count
        case 1:
            return imagesArr.count
        case 2:
            return 0
        case 3:
            return 0
        default :
            break
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch segmentControl.selectedSegmentIndex{
        case 0 :
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let transition = storyboard.instantiateViewController(withIdentifier: "detailsVC" ) as! OrderDetailsViewController
            transition.strd = UIImage(named: "burger")
            
            transition.name = burgerName[indexPath.row]
            transition.cateogry = "Burger"
             navigationController?.pushViewController(transition, animated: true)
        case 1:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let transition = storyboard.instantiateViewController(withIdentifier: "detailsVC" ) as! OrderDetailsViewController
            transition.strd = UIImage(named: "piza")
            transition.name = pizzaNames[indexPath.row]
            transition.cateogry = "pizza"

            
             navigationController?.pushViewController(transition, animated: true)
//        case 2:
//        case 3:
            
        default :
            break
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240.0
    }
    
    
    
}
