//
//  RollCallViewController.swift
//  Demo_Private
//
//  Created by Michael Lin on 8/26/20.
//  Copyright © 2020 Michael Lin. All rights reserved.
//

import UIKit

class RollCallViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var rejectButton: UIButton!
    @IBOutlet weak var acceptButton: UIButton!
    
    // Top 6 Baby Names of 2019 - Source: ssa.gov
    let nameList = ["Liam", "Olivia", "Noah", "Emma", "Oliver", "Ava"].shuffled()
    
    var nameToCall: [String]!
    
    var namePresent: [String] = []
    var nameAbsent: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rejectButton.layer.cornerRadius = rejectButton.frame.size.width / 2
        
        acceptButton.layer.cornerRadius = acceptButton.frame.size.width / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameToCall = nameList
        nameLabel.text = nameToCall.removeFirst()
        namePresent = []
        nameAbsent = []
    }
    
    @IBAction func rejectNameCallback(_ sender: Any) {
        self.nameAbsent.append(self.nameLabel.text!)
        if nameToCall.count != 0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.nameLabel.alpha = 0
            }, completion: { _ in
                UIView.animate(withDuration: 0.2, animations: {
                    self.nameLabel.alpha = 1
                    self.nameLabel.text = self.nameToCall.removeFirst()
                })
            })
        } else {
            self.performSegue(withIdentifier: "toResultSegue", sender: self)
        }
    }
    
    @IBAction func acceptNameCallback(_ sender: Any) {
        self.namePresent.append(self.nameLabel.text!)
        if nameToCall.count != 0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.nameLabel.alpha = 0
            }, completion: { _ in
                UIView.animate(withDuration: 0.2, animations: {
                    self.nameLabel.alpha = 1
                    self.nameLabel.text = self.nameToCall.removeFirst()
                })
            })
        } else {
            self.performSegue(withIdentifier: "toResultSegue", sender: self)
        }
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ResultViewController else { return }
        vc.nameAbsent = self.nameAbsent
        vc.namePresent = self.namePresent
    }
}
