//
//  SettingsViewController.swift
//  tipmunk
//
//  Created by Nari Kim Shin on 7/23/16.
//  Copyright © 2016 Nari Shin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var customTextField1: UITextField!
    @IBOutlet weak var customTextField2: UITextField!
    @IBOutlet weak var customTextField3: UITextField!
    
    
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
    
    @IBAction func onTap(sender: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @IBAction func customText1Changed(sender: AnyObject) {
        persistCurrentValue(customTextField1.text!, key: "custom_1")
    }
    
    @IBAction func customText2Changed(sender: AnyObject) {
        persistCurrentValue(customTextField2.text!, key: "custom_2")
    }
    
    @IBAction func customText3Changed(sender: AnyObject) {
        persistCurrentValue(customTextField3.text!, key: "custom_3")
    }
    
    
    func persistCurrentValue(valueString: String, key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let value = Int(valueString) ?? 0
        defaults.setInteger(value, forKey: key)
        defaults.synchronize()
    }
    

    // Need a validation that input values are less than 100


}
