
//
//  ViewController.swift
//  tipmunk
//
//  Created by Nari Kim Shin on 7/23/16.
//  Copyright © 2016 Nari Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let CONTROL_INDEX_KEY = "default_position"

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalView: UIView!
    
    var value1: Int!
    var value2: Int!
    var value3: Int!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        initView()
        calculate()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onEditingStarted(sender: AnyObject) {
        UIView.animateWithDuration(0.4, animations: {
            self.totalView.alpha = 1
        })
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        let position = tipControl.selectedSegmentIndex
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(position, forKey: CONTROL_INDEX_KEY)
        defaults.synchronize()
        
        calculate()
    }
    
    func calculate() {
        let tipPercentages = [Double(value1)/100.0, Double(value2)/100.0, Double(value3)/100.0]
        
        // ?? : returns the right value if the left value is equal to nil
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func initView() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        value1 = defaults.integerForKey("custom_1") == 0 ? 18 : defaults.integerForKey("custom_1")
        value2 = defaults.integerForKey("custom_2") == 0 ? 20 : defaults.integerForKey("custom_2")
        value3 = defaults.integerForKey("custom_3") == 0 ? 25 : defaults.integerForKey("custom_3")
        
        tipControl.setTitle(String(value1) + "%", forSegmentAtIndex: 0)
        tipControl.setTitle(String(value2) + "%", forSegmentAtIndex: 1)
        tipControl.setTitle(String(value3) + "%", forSegmentAtIndex: 2)
        
        tipControl.selectedSegmentIndex = defaults.integerForKey("default_position")
        
        // Hide total view initially
        if(Double(billField.text!) > 0) {
            self.totalView.alpha = 1
        } else {
            self.totalView.alpha = 0
        }
    }
}

