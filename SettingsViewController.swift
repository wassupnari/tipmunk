//
//  SettingsViewController.swift
//  tipmunk
//
//  Created by Nari Kim Shin on 7/23/16.
//  Copyright © 2016 Nari Shin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let CONTROL_INDEX_KEY = "default_position"

    @IBOutlet weak var customTextField1: UITextField!
    @IBOutlet weak var customTextField2: UITextField!
    @IBOutlet weak var customTextField3: UITextField!
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        initView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        customTextField1.text = String(defaults.integerForKey("custom_1") ?? 18)
        customTextField2.text = String(defaults.integerForKey("custom_2") ?? 20)
        customTextField3.text = String(defaults.integerForKey("custom_3") ?? 25)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initView() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let value1 = defaults.integerForKey("custom_1") ?? 18
        let value2 = defaults.integerForKey("custom_2") ?? 20
        let value3 = defaults.integerForKey("custom_3") ?? 25
        
        defaultTipControl.setTitle(String(value1) + "%", forSegmentAtIndex: 0)
        defaultTipControl.setTitle(String(value2) + "%", forSegmentAtIndex: 1)
        defaultTipControl.setTitle(String(value3) + "%", forSegmentAtIndex: 2)
        
        defaultTipControl.selectedSegmentIndex = defaults.integerForKey(CONTROL_INDEX_KEY)
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @IBAction func customText1Changed(sender: AnyObject) {
        persistCurrentValue(customTextField1.text!, key: "custom_1")
        defaultTipControl.setTitle(String(customTextField1.text!) + "%", forSegmentAtIndex: 0)
    }
    
    @IBAction func customText2Changed(sender: AnyObject) {
        persistCurrentValue(customTextField2.text!, key: "custom_2")
        defaultTipControl.setTitle(String(customTextField2.text!) + "%", forSegmentAtIndex: 1)
    }
    
    @IBAction func customText3Changed(sender: AnyObject) {
        persistCurrentValue(customTextField3.text!, key: "custom_3")
        defaultTipControl.setTitle(String(customTextField3.text!) + "%", forSegmentAtIndex: 2)
    }
    
    // Need a validation that input values are less than 100
    func persistCurrentValue(valueString: String, key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let value = Int(valueString) ?? 0
        defaults.setInteger(value, forKey: key)
        defaults.synchronize()
    }
    
    @IBAction func valueChanged(sender: AnyObject) {
        let position = defaultTipControl.selectedSegmentIndex
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(position, forKey: CONTROL_INDEX_KEY)
        defaults.synchronize()
    }
}
