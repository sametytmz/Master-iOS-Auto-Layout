//
//  ViewController.swift
//  Content Hugging and Compression
//
//  Created by Samet Yatmaz on 4.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shortTitle1: UILabel!
    @IBOutlet weak var shortMsg1: UILabel!
    
    @IBOutlet weak var shortTitle2: UILabel!
    @IBOutlet weak var shortMsg2: UILabel!
    
    @IBOutlet weak var shortTitle3: UILabel!
    @IBOutlet weak var shortMsg3: UILabel!
    
    @IBOutlet weak var longTitle1: UILabel!
    @IBOutlet weak var longMsg1: UILabel!
    
    @IBOutlet weak var longTitle2: UILabel!
    @IBOutlet weak var longMsg2: UILabel!
    
    @IBOutlet weak var longTitle3: UILabel!
    @IBOutlet weak var longMsg3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shortTitle1.text = "Udemy"
        shortMsg1.text = "Thanksgiving Sale Now"
        
        shortTitle2.text = "Udemy"
        shortMsg2.text = "Thanksgiving Sale Now"
        
        shortTitle3.text = "Udemy"
        shortMsg3.text = "Thanksgiving Sale Now"
        
        longTitle1.text = "Udemy Thanksgiving Sale"
        longMsg1.text = "Courses start at $9.99"
        
        longTitle2.text = "Udemy Thanksgiving Sale"
        longMsg2.text = "Courses start at $9.99"
        
        longTitle3.text = "Udemy Thanksgiving Sale"
        longMsg3.text = "Courses start at $9.99"
    }


}



