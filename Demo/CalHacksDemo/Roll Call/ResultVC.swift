//
//  ResultVC.swift
//  CalHacksDemo
//
//  Created by Michael Lin on 8/26/20.
//  Copyright © 2020 Michael Lin. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {

    @IBOutlet weak var presentListLabel: UILabel! {
        didSet {
            presentListLabel.text = Roster.main.namesPresent.joined(separator: ", ")
        }
    }
    
    @IBOutlet weak var absentListLabel: UILabel! {
        didSet {
            absentListLabel.text = Roster.main.namesAbsent.joined(separator: ", ")
        }
    }
    
    @IBOutlet weak var resetButton: UIButton! {
        didSet {
            resetButton.addAction(UIAction { [unowned self] _ in
                Roster.main.reset()
                self.dismiss(animated: true, completion: nil)
            }, for: .touchUpInside)
        }
    }
}
