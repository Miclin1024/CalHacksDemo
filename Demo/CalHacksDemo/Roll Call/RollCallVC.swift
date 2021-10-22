//
//  RollCallVC.swift
//  CalHacksDemo
//
//  Created by Michael Lin on 8/26/20.
//  Copyright © 2020 Michael Lin. All rights reserved.
//

import UIKit

class RollCallVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var presentButton: UIButton! {
        didSet {
            presentButton.addAction(UIAction { [unowned self] _ in
                Roster.main.addName(toPresent: self.currentName)
                self.showNextNameOrResult()
            }, for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var absentButton: UIButton! {
        didSet {
            absentButton.addAction(UIAction { [unowned self] _ in
                Roster.main.addName(toAbsent: self.currentName)
                self.showNextNameOrResult()
            }, for: .touchUpInside)
        }
    }
    
    var currentName: String! {
        return nameLabel.text
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameLabel.text = Roster.main.getNextName()
    }
    
    private func showNextNameOrResult() {
        if let name = Roster.main.getNextName() {
            setUserInteractionEnabled(to: false)
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                self.nameLabel.alpha = 0
            }, completion: { _ in
                self.nameLabel.text = name
                self.setUserInteractionEnabled(to: true)
                UIView.animate(withDuration: 0.3, animations: {
                    self.nameLabel.alpha = 1
                })
            })
        } else {
            performSegue(withIdentifier: "toResults", sender: nil)
        }
    }
    
    private func setUserInteractionEnabled(to value: Bool) {
        presentButton.isUserInteractionEnabled = value
        absentButton.isUserInteractionEnabled = value
    }
}
