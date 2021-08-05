//
//  ViewController.swift
//  Constraints Runtime Update
//
//  Created by Samet Yatmaz on 5.08.2021.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var blueView: UIView! {
        didSet {
            blueView.layer.cornerRadius = 20.0
        }
    }
    @IBOutlet weak var blueViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var yellowViewLeadingConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapSwitchViewsButton(_ sender: Any) {
        
        UIView.animate(withDuration: 2.0) { [weak self] in
            guard let self = self else { return }
            
            if self.yellowViewLeadingConstraint.constant == 0 {
                self.yellowViewLeadingConstraint.constant = -1 * self.view.frame.width
            } else {
                self.yellowViewLeadingConstraint.constant = 0
            }
            
            if self.blueViewTopConstraint.constant == 0 {
                self.blueViewTopConstraint.constant = 0.4 * self.view.frame.height
            } else {
                self.blueViewTopConstraint.constant = 0
            }
            
            self.view.layoutIfNeeded()
        }
        
    }
    
}

