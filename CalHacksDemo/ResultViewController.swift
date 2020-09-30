//
//  ResultViewController.swift
//  Demo_Private
//
//  Created by Michael Lin on 8/26/20.
//  Copyright © 2020 Michael Lin. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var namePresent: [String]!
    var nameAbsent: [String]!
    
    @IBOutlet weak var presentNamesLabel: UILabel!
    @IBOutlet weak var absentNamesLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentNamesLabel.font = UIFont.systemFont(ofSize: 22)
        presentNamesLabel.text = namePresent.joined(separator: ", ")
        
        absentNamesLabel.font = UIFont.systemFont(ofSize: 22)
        absentNamesLabel.text = nameAbsent.joined(separator: ", ")
        
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.white, for: .normal)
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    }
    
    @IBAction func resetCallback(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
