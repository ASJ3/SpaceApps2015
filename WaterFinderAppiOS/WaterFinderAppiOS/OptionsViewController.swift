//
//  OptionsViewController.swift
//  WaterFinderAppiOS
//
//  Created by Alexis Saint-Jean on 4/19/15.
//  Copyright (c) 2015 Alexis Saint-Jean. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {

    @IBAction func closingButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func selectDrinking(sender: AnyObject) {
        println("Drinking Selected")
    }
    @IBAction func selectWashing(sender: AnyObject) {
        println("Washing Selected")
    }
    @IBAction func selectAnimals(sender: AnyObject) {
        println("Animals Selected")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
