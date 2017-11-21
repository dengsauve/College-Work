//
//  BookTableViewCell.swift
//  Core-Data-Demo
//
//  Created by Dennis Sauve on 11/21/17.
//  Copyright © 2017 Dennis Sauve. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    
    // Methods
    func update(with book: Book){
        self.titleLabel.text = book.title
        self.authorLabel.text = book.author
        self.genreLabel.text = book.genre
        self.lengthLabel.text = book.length
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
