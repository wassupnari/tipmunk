
//
//  ViewController.swift
//  tipmunk
//
//  Created by Nari Kim Shin on 7/23/16.
//  Copyright © 2016 Nari Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        readFromUserDefaults()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
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
    
    @IBAction func calculateTip(sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        // ?? : returns the right value if the left value is equal to nil
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func readFromUserDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let value1 = defaults.integerForKey("custom_1") ?? 18
        let value2 = defaults.integerForKey("custom_2") ?? 20
        let value3 = defaults.integerForKey("custom_3") ?? 25
        
        tipControl.setTitle(String(value1) + "%", forSegmentAtIndex: 0)
        tipControl.setTitle(String(value2) + "%", forSegmentAtIndex: 1)
        tipControl.setTitle(String(value3) + "%", forSegmentAtIndex: 2)
    }
}

