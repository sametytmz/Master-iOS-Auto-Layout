//
//  BookTableViewCell.swift
//  DynamicTableviewCell
//
//  Created by Samet Yatmaz on 8.08.2021.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(bookInfo: [String: String]) {
        guard
            let title = bookInfo["title"],
            let author = bookInfo["author"],
            let summary = bookInfo["summary"]
        else { return }
        
        titleLabel.text = title
        authorLabel.text = author
        summaryLabel.text = summary
    }
}

