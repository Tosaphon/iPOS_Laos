//
//  EditMenuTableViewController.swift
//  iPOS_Laos
//
//  Created by NEXUS Mac on 28/9/59.
//  Copyright © พ.ศ. 2559 NEXUS Mac. All rights reserved.
//

import UIKit

class EditMenuTableViewController: UITableViewController {
    
    var numberOfGroupMenu = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfGroupMenu = groupAll.count

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return numberOfGroupMenu
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        for index in 0...numberOfGroupMenu-1{
            if section == index {
                return groupAll[index].count
            }
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EditMenuTableViewCell
    
        
        for index in 0...numberOfGroupMenu-1{
            if indexPath.section == index {
                let item = menuAll[index].menu[indexPath.row]
                cell.menuName.text = menuAll[index].menu[indexPath.row].name
                cell.menuPicture.image = UIImage(named: item.picture)
                cell.menuPrice.text = "\(item.price)"
                if item.discountMoney == 0 && item.discountPercent == 0 {
                    cell.discount.text = ""
                }else if item.discountMoney != 0 {
                    cell.discount.text = "\(item.discountMoney)"
                }else{
                    cell.discount.text = "\(item.discountPercent)"
                }
            }
        }
        
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        if let indexPath = tableView.indexPathForSelectedRow{
            let item = menuAll[indexPath.section].menu[indexPath.row]
            let viewController = segue.destination as! EditMenuViewController
            if segue.identifier == "edit"{
                print(item.name)
                viewController.name = item.name
                viewController.price = "\(item.price)"
                
            }else if segue.identifier == "add"{
                
            }
        }
        
        
        
        
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        for i in 0...groupAll.count-1{
            if section == i {
                return groupAll[i].name
            }
        }
        return ""
    }
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
