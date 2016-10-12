//
//  OrderTableViewController.swift
//  iPOS_Laos
//
//  Created by NEXUS Mac on 27/9/59.
//  Copyright © พ.ศ. 2559 NEXUS Mac. All rights reserved.
//

import UIKit

class OrderTableViewController: UITableViewController,MenuCollectionViewControllerDelegate {
    
    weak var delegate : MenuCollectionViewControllerDelegate?

    @IBAction func Cancel(_ sender: AnyObject) {
        myOrder.removeAll()
        tableView.reloadData()
    }
    
    var totalPrice : Double = 0
    var myOrder = [Order()]
    var menu = Menu()
    var detailViewController: MenuCollectionViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.navigationBar.barTintColor = UIColor(red: 71/255, green: 144/255, blue: 210/255, alpha: 255/255)
//        self.tableView.backgroundColor = UIColor.black
        
        myOrder.removeAll()
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = controllers[controllers.count-1] as? MenuCollectionViewController
        }
        self.detailViewController?.delegate = self
        
    
        
//        self.detailViewController?.delegate = self
//        self.detailViewController = controllers[controllers.count-1].topViewController as? MenuCollectionViewController

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func didSelectMenuItem(order: Menu) {
//        var newOrder = Order()
//        newOrder.menuList = order
//        myOrder.append(newOrder)
        
//        for tempOrder in myOrder where menu.name != order.name {
//                myOrder.append(tempOrder)
//            print(tempOrder.menuList.name)
//        }
//        for tempOrder in myOrder where menu.name == order.name {
//            for i in 0...myOrder.count-1{
//                let name = myOrder[i].menuList.name
//                if name == tempOrder.menuList.name{
//                    myOrder[i].quan += 1
//                    print(tempOrder.menuList.name)
//                }
//            }
//        }
        
        var isUniq = true
        if myOrder.count != 0 {
            for i in 0...myOrder.count-1{
                if order.name == myOrder[i].menuList.name{
                    myOrder[i].quan += 1
                    totalPrice += Double(order.price)
                    isUniq = false
                }
            }
            if isUniq {
                let newOrder = Order()
                newOrder.menuList = order
                myOrder.append(newOrder)
                totalPrice += Double(order.price)
            }
        }else{
            let newOrder = Order()
            newOrder.menuList = order
            myOrder.append(newOrder)
            totalPrice = Double(order.price)
        }
        tableView.reloadData()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return myOrder.count+2
        }else{
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomOrderTableViewCell

        
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                cell.Lable1.text = "รายการอาหาร"
                cell.price.text = "ราคา"
                cell.quan.text = "จำนวน"
                cell.stepper.isHidden = true
                
            }else if indexPath.row == myOrder.count+1{
                
                cell.Lable1.text = "Total"
                cell.price.text = "\(totalPrice) B"
                cell.quan.text = ""
            }else{
                cell.Lable1.text = myOrder[indexPath.row-1].menuList.name
                cell.price.text = "\(myOrder[indexPath.row-1].menuList.price)"
                cell.quan.text = "\(myOrder[indexPath.row-1].quan)"
//                cell.stepper.isHidden = false
            }
        default:
            cell.Lable1.text = "Print"
            cell.price.text = ""
            cell.quan.text = ""
            cell.stepper.isHidden = true
        }
        return cell
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            
//        }
//    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
