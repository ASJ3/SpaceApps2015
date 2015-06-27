//
//  DetailViewController.swift
//  MapSample
//
//  Created by Alexis Saint-Jean on 6/21/15.
//  Copyright (c) 2015 Alexis Saint-Jean. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var beneficiariesLabel: UILabel!
    @IBOutlet weak var donorLabel: UILabel!
    @IBOutlet weak var completionDateLabel: UILabel!

    @IBAction func dimissVC(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    var nameText = ""
    var beneficiariesText = ""
    var donorText = ""
    var completionText = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nameText
        beneficiariesLabel.text = beneficiariesText
        donorLabel.text = donorText
        completionDateLabel.text = completionText
    }
    
}
