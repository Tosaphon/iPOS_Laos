//
//  EditMenuViewController.swift
//  iPOS_Laos
//
//  Created by NEXUS Mac on 28/9/59.
//  Copyright © พ.ศ. 2559 NEXUS Mac. All rights reserved.
//

import UIKit

class EditMenuViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    


    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var addGroupButtonLabel: UIButton!
    @IBOutlet weak var bahtLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtDiscount: UITextField!
    @IBOutlet weak var groupPicker: UIPickerView!
    @IBOutlet weak var switchPercent: UISwitch!
    
    var name = ""
    var price = ""
    var discount = ""
    var discountPercent = ""
    
    @IBAction func chooseImage(_ sender: AnyObject) {
    }
    
    
    @IBAction func addGroup(_ sender: AnyObject) {
    }
    @IBAction func cancel(_ sender: AnyObject) {
        navigationController?.popViewController(animated: true)
    }
   
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return groupAll.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return groupAll[row].name
    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return groupAll.count
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return groupAll[row].name
//    }
    

    
    @IBAction func save(_ sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(groupAll.count)
        self.groupPicker.delegate = self
        self.groupPicker.dataSource = self
        
//        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+100)
        scrollView.isScrollEnabled = true
        scrollView.contentSize.height = 1800
        scrollView.showsHorizontalScrollIndicator = true
        
        txtName.text = name
        
            txtPrice.text = price
        
        txtDiscount.text = discount
        
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
