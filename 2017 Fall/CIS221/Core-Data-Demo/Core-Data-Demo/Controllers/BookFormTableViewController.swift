//
//  BookFormTableViewController.swift
//  Core-Data-Demo
//
//  Created by Dennis Sauve on 11/21/17.
//  Copyright © 2017 Dennis Sauve. All rights reserved.
//

import UIKit

class BookFormTableViewController: UITableViewController {

    // Structs
    struct PropertyKeys {
        static let unwind = "UnwindToBookTable"
    }
    
    // Variables
    
    // Optionals
    var book: Book?
    
    // Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    
    // Actions
    
    // Delegates
    
    // Functions
    
    func updateView() {
        guard let book = book else {return}
        
        titleTextField.text = book.title
        authorTextField.text = book.author
        genreTextField.text = book.genre
        lengthTextField.text = book.length
    }
    
    // Overrides    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Hadn't ever thought of not using a button, this is slick!
        if indexPath.section == 4 {
            guard let title = titleTextField.text,
                let author = authorTextField.text,
                let genre = genreTextField.text,
                let length = lengthTextField.text else {return}
            
            book = Book(title: title, author: author, genre: genre, length: length)
            performSegue(withIdentifier: PropertyKeys.unwind, sender: self)
        }
    }

}
