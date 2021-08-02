//
//  ViewController.swift
//  Constraints Priority
//
//  Created by Samet Yatmaz on 2.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var paperBackButton: UIButton?
    @IBOutlet weak var iBookButton: UIButton?
    @IBOutlet weak var kindleButton: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapBookType(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else {return}
            
            switch sender.tag {
            case 0:
                
                if let iBookButton = self.iBookButton {
                    iBookButton.removeFromSuperview()
                }
                
                if let kindleButton = self.kindleButton {
                    kindleButton.removeFromSuperview()
                }
                
            case 1:
            
                if let kindleButton = self.kindleButton {
                    kindleButton.removeFromSuperview()
                }
                
            case 2:
         
                if let iBookButton = self.iBookButton {
                    iBookButton.removeFromSuperview()
                }
        
            default: break
                
            }
            
            self.view.layoutIfNeeded()
        }
    }
    
}
