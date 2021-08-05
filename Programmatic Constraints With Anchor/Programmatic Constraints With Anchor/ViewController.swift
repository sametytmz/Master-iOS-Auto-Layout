//
//  ViewController.swift
//  Programmatic Constraints With Anchor
//
//  Created by Samet Yatmaz on 5.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "Layout Anchor"
        titleLabel.backgroundColor = UIColor.yellow
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let mainButton = UIButton()
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Frame
        mainButton.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.size.width-40, height: 40)
        mainButton.backgroundColor = UIColor.blue
        mainButton.layer.borderWidth = 2
        mainButton.layer.borderColor = UIColor.red.cgColor
        mainButton.layer.cornerRadius = 5
        
        // Label
        mainButton.setTitle("Main Button", for: UIControl.State())
        mainButton.setTitleColor(UIColor.white, for: UIControl.State())
        mainButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20.0)
        
        // Target
        mainButton.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: UIControl.Event.touchUpInside)

        self.view.addSubview(mainButton)
        
        // Constraints
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40.0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0).isActive = true
        
        mainButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40.0).isActive = true
        mainButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
        mainButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0).isActive = true
        
        
        // VIEW
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        // Frame
        myView.layer.borderWidth = 1
        myView.layer.borderColor = UIColor.gray.cgColor

        
        self.view.addSubview(myView)
        
        // Constraint
        myView.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: 40.0).isActive = true
        myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
        myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0).isActive = true
        myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40.0).isActive = true
        
        
        
        let numberOfButtons = Int(arc4random_uniform(3)) + 1 // 0 - 2
        print("total buttons: \(numberOfButtons)")
        
        var arrButtons = [UIButton]()
        
        for x in 0..<numberOfButtons {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            
            arrButtons.append(button)
            
            // Frame
            button.backgroundColor = UIColor.blue
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.red.cgColor
            button.layer.cornerRadius = 5
            
            // Label
            button.setTitle("Button \(x)", for: UIControl.State())
            button.setTitleColor(UIColor.white, for: UIControl.State())
            button.titleLabel?.font = UIFont(name: "Avenir", size: 20.0)
            
            myView.addSubview(button)
            
            if x == 0 {
                button.topAnchor.constraint(equalTo: myView.topAnchor, constant: 40.0).isActive = true
            }
            else {
                button.topAnchor.constraint(equalTo: arrButtons[x-1].bottomAnchor, constant: 10.0).isActive = true
            }
            
            button.centerXAnchor.constraint(equalTo: myView.centerXAnchor).isActive = true
            button.widthAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 0.5).isActive = true
            
            // Target
            button.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: UIControl.Event.touchUpInside)
            
            
        }
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        print("\(String(describing: sender.titleLabel!.text)) pressed")
    }

    
}
