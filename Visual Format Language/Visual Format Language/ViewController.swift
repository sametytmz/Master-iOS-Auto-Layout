//
//  ViewController.swift
//  Visual Format Language
//
//  Created by Samet Yatmaz on 8.08.2021.
//

import UIKit

enum Padding {
    static let `default`: CGFloat = 20.0
}

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    let mainButton = UIButton()
    let myView = UIView()
    var viewConstraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.backgroundColor = UIColor.yellow
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        mainButton.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.size.width-40, height: 40)
        mainButton.backgroundColor = UIColor.blue
        mainButton.layer.borderWidth = 2
        mainButton.layer.borderColor = UIColor.red.cgColor
        mainButton.layer.cornerRadius = 5
        mainButton.setTitle("Main Button", for: UIControl.State())
        mainButton.setTitleColor(UIColor.white, for: UIControl.State())
        mainButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20.0)
        mainButton.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: UIControl.Event.touchUpInside)

        self.view.addSubview(mainButton)
        
        // VIEW
        
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.layer.borderWidth = 1
        myView.layer.borderColor = UIColor.gray.cgColor
        
        self.view.addSubview(myView)
    }
    
    override func viewSafeAreaInsetsDidChange() {
        if !viewConstraints.isEmpty {
            NSLayoutConstraint.deactivate(viewConstraints)
            viewConstraints.removeAll()
        }
        
        let safeAreaInsets = view.safeAreaInsets
        let leftInset = safeAreaInsets.left > 0 ? safeAreaInsets.left : Padding.default
        let rightInset = safeAreaInsets.right > 0 ? safeAreaInsets.right : Padding.default
        let topInset = safeAreaInsets.top > 0 ? safeAreaInsets.top : Padding.default
        let bottomInset = safeAreaInsets.bottom > 0 ? safeAreaInsets.bottom : Padding.default
        
        let viewsDict: [String: Any] = [
            "titleLabel": titleLabel,
            "mainButton": mainButton,
            "myView": myView,
            "view": view
        ]
        
        let metrics: [String: CGFloat] = [
            "defaultPadding": Padding.default,
            "leftInset": leftInset,
            "rightInset": rightInset,
            "topInset": topInset,
            "bottomInset": bottomInset
        ]
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-topInset-[titleLabel]-40-[mainButton]-40-[myView]-bottomInset-|", options: [.alignAllCenterX], metrics: metrics, views: viewsDict)
        viewConstraints += verticalConstraints
        
        let mainButtonHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-leftInset-[mainButton]-rightInset-|", options: [], metrics: metrics, views: viewsDict)
        viewConstraints += mainButtonHorizontalConstraints
        
        let myViewHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-leftInset-[myView]-rightInset-|", options: [], metrics: metrics, views: viewsDict)
        viewConstraints += myViewHorizontalConstraints
        
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
            
            // Add the button to view first before activating any constraints
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
        
        NSLayoutConstraint.activate(viewConstraints)
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        print("\(String(describing: sender.titleLabel!.text)) pressed")
    }

    
}


