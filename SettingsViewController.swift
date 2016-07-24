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
        persistCurrentValue()
    }
    
    @IBAction func customText2Changed(sender: AnyObject) {
        persistCurrentValue()
    }
    
    @IBAction func customText3Changed(sender: AnyObject) {
        persistCurrentValue()
    }
    
    
    func persistCurrentValue() {
        let defaults = NSUserDefaults.standardUserDefaults()
        print("onTap" + String(customTextField1.text))
        let value1 = Int(customTextField1.text!) ?? 0
        let value2 = Int(customTextField2.text!) ?? 0
        let value3 = Int(customTextField3.text!) ?? 0
        defaults.setInteger(value1, forKey: "custom_1")
        defaults.setInteger(value2, forKey: "custom_2")
        defaults.setInteger(value3, forKey: "custom_3")
        print("value : " + String(value1))
        defaults.synchronize()
    }
    

    // Need a validation that input values are less than 100

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
