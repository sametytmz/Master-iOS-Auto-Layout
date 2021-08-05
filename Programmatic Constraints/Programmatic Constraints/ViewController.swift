//
//  ViewController.swift
//  Programmatic Constraints
//
//  Created by Samet Yatmaz on 5.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mainButton = UIButton()
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        
        mainButton.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.size.width - 40, height: 40.0)
        mainButton.backgroundColor = UIColor.blue
        mainButton.layer.borderWidth = 2
        mainButton.layer.borderColor = UIColor.red.cgColor
        mainButton.layer.cornerRadius = 5
        mainButton.setTitle("Main Button", for: UIControl.State())
        mainButton.setTitleColor(UIColor.white, for: UIControl.State())
        mainButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20.0)
        mainButton.addTarget(self, action: #selector(ViewController.buttonAction(sender:)), for: .touchUpInside)
        
        self.view.addSubview(mainButton)
        
        NSLayoutConstraint(item: mainButton, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1.0, constant: 40.0).isActive = true
        
        NSLayoutConstraint(item: mainButton, attribute: .leading, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 20.0).isActive = true
        
        NSLayoutConstraint(item: mainButton, attribute: .trailing, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -20.0).isActive = true
        
        
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        myView.layer.borderWidth = 1
        myView.layer.borderColor = UIColor.gray.cgColor
        
        self.view.addSubview(myView)
        
        let myViewTopConstraint = NSLayoutConstraint(item: myView, attribute: .top, relatedBy: .equal, toItem: mainButton, attribute: .bottom, multiplier: 1.0, constant: 40.0)
        
        let myViewLeadingConstraint = NSLayoutConstraint(item: myView, attribute: .leading, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 20.0)
        
        let myViewTrailingConstraint = NSLayoutConstraint(item: myView, attribute: .trailing, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: -20.0)
        
        let myViewBottomConstraint = NSLayoutConstraint(item: myView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: -40.0)
        
        self.view.addConstraints([myViewTopConstraint, myViewLeadingConstraint, myViewTrailingConstraint, myViewBottomConstraint])
        
        
        let firstButton = UIButton()
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.size.width / 3, height: 40.0)
        firstButton.backgroundColor = UIColor.blue
        firstButton.layer.borderWidth = 2
        firstButton.layer.borderColor = UIColor.red.cgColor
        firstButton.layer.cornerRadius = 5
        firstButton.setTitle("First Button", for: UIControl.State())
        firstButton.setTitleColor(UIColor.white, for: UIControl.State())
        firstButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20.0)
        self.view.addSubview(firstButton)
        
        let firstButtonTopConstraint = NSLayoutConstraint(item: firstButton, attribute: .top, relatedBy: .equal, toItem: myView, attribute: .top, multiplier: 1.0, constant: 40.0)
        
        let firstButtonCenterXConstraint = NSLayoutConstraint(item: firstButton, attribute: .centerX, relatedBy: .equal, toItem: myView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        
        self.view.addConstraints([firstButtonTopConstraint, firstButtonCenterXConstraint])
        
    }

    @objc func buttonAction(sender: UIButton) {
        print("\(String(describing: sender.titleLabel?.text)) is tapped")
    }
}



