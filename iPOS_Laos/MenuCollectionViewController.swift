//
//  MenuCollectionViewController.swift
//  iPOS_Laos
//
//  Created by NEXUS Mac on 27/9/59.
//  Copyright © พ.ศ. 2559 NEXUS Mac. All rights reserved.
//

import UIKit

var gOrder = [Order()]
var menuAll = [MenuList()]
var groupAll = [GroupMenu()]

private let reuseIdentifier = "Cell"

protocol MenuCollectionViewControllerDelegate : class{
    func didSelectMenuItem(order:Menu)
}

class MenuCollectionViewController: UICollectionViewController {
    var menu = Menu()
    var tempMenu = [Menu()]
    
    
    
    var numberOfGroupMenu = 0
    
    var c = 0
    
    var headerName = ""
    weak var delegate:MenuCollectionViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        self.collectionView?.backgroundColor = UIColor(red: 59/255, green: 62/255, blue: 63/255, alpha: 1)
        self.collectionView?.backgroundColor = UIColor.white
        
        loadMenu()
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 10
        
        
//        UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
//        collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadMenu() -> Void {
        menuAll.removeAll()
        groupAll.removeAll()
        let gMenu1 = GroupMenu()
        let gMenu2 = GroupMenu()
        gMenu1.number = 0
        gMenu1.name = "Food"
        gMenu1.count = 4
        gMenu2.number = 1
        gMenu2.name = "Drink"
        gMenu2.count = 2
        
        groupAll.append(gMenu1)
        groupAll.append(gMenu2)
        
        let menu1 = Menu()
        menu1.setMenu(name: "BBQ", price: 200, discountPercent: 0, discountMoney: 0, picture: "noimage.jpeg",group: 0)
        let menu2 = Menu()
        menu2.setMenu(name: "KFC with egg and popcorn extra plusss", price: 199, discountPercent: 0, discountMoney: 0, picture: "noimage.jpeg",group: 0)
        let menu3 = Menu()
        menu3.setMenu(name: "Curry", price: 50, discountPercent: 0, discountMoney: 0, picture: "noimage.jpeg",group: 0)
        let menu4 = Menu()
        menu4.setMenu(name: "Rice", price: 10, discountPercent: 0, discountMoney: 0, picture: "noimage.jpeg",group: 0)
        let menu5 = Menu()
        menu5.setMenu(name: "Orange juice", price: 90, discountPercent: 0, discountMoney: 0, picture: "noimage.jpeg",group: 1)
        let menu6 = Menu()
        menu6.setMenu(name: "Water", price: 20, discountPercent: 0, discountMoney: 0, picture: "noimage.jpeg",group: 1)
        
        let menuList1 = MenuList()
        menuList1.menu.removeAll()
        menuList1.menu.append(menu1)
        menuList1.menu.append(menu2)
        menuList1.menu.append(menu3)
        menuList1.menu.append(menu4)
        menuList1.groupNo = 0
        menuList1.groupName = "Food"
        
        menuAll.append(menuList1)
        
        let menuList2 = MenuList()
        menuList2.menu.removeAll()
        menuList2.menu.append(menu5)
        menuList2.menu.append(menu6)
        menuList1.groupNo = 1
        menuList1.groupName = "Drink"
        menuAll.append(menuList2)
        
        
        numberOfGroupMenu = groupAll.count
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return numberOfGroupMenu
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        for index in 0...numberOfGroupMenu-1{
            if section == index {
                return groupAll[index].count
            }
        }
        
        return 0
        
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomMenuCollectionViewCell

        for index in 0...numberOfGroupMenu-1{
            if indexPath.section == index {
                    cell.name.text = menuAll[index].menu[indexPath.row].name
                cell.name.textColor = UIColor.black
            }
        }
        
    
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headersection", for: indexPath) as! HeaderCollectionReusableView
        
        
        for index in 0...numberOfGroupMenu-1{
            if indexPath.section == index {
                header.name.text = groupAll[index].name
//                header.backgroundColor = UIColor.lightGray
            }
        }
        
        return header
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        
        return CGSize(width: collectionView.bounds.width, height: 50.0)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let navController : UINavigationController = self.splitViewController?.viewControllers[0] as! UINavigationController
        let controller = navController.topViewController as! OrderTableViewController
        
        for index in 0...menuAll.count-1{
            if indexPath.section == index {
                controller.didSelectMenuItem(order: menuAll[index].menu[indexPath.row])
                navigationItem.title = menuAll[index].menu[indexPath.row].name
            }
        }
        
    }
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
