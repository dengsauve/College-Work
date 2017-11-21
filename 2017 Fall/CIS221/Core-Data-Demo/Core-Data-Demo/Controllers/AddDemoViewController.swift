//
//  AddDemoViewController.swift
//  Core-Data-Demo
//
//  Created by Dennis Sauve on 11/19/17.
//  Copyright © 2017 Dennis Sauve. All rights reserved.
//

import UIKit
// Step 1: Import CoreData
import CoreData

protocol AddDemoViewControllerDelegate {
    func didAddString()
    func didAddNumber()
    func didUpdate()
}

class AddDemoViewController: UIViewController {

    // Variables
    var delegate: AddDemoViewControllerDelegate?
    var indexPath: IndexPath?
    var entityToUpdate: NSManagedObject?
    
    // Outlets
    @IBOutlet weak var dataTypeTextField: UITextField!
    @IBOutlet weak var dataTypeSegmented: UISegmentedControl!
    @IBOutlet weak var addEditButton: UIButton!
    
    
    // Actions
    @IBAction func addButtonPressed(_ sender: Any) {
        
        // Step 2: Create instance of appDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            print("Error on guard")
            
            return
        }
        
        // Step 3: Create ORM context
        let context = appDelegate.persistentContainer.viewContext
        
        if let indexPath = indexPath,
            let entityToUpdate = entityToUpdate // Update Mode
        {
            if(indexPath.section == 0)
            {
                entityToUpdate.setValue(dataTypeTextField.text, forKey: "stringEntered")
            }
            else
            {
                entityToUpdate.setValue(dataTypeTextField.text, forKey: "numberEntered")
            }
            
            do
            {
                try context.save()
                self.delegate?.didUpdate()
                self.navigationController?.popViewController(animated: true)
            }
            catch let error as NSError
            {
                print("display error - \(error)")
            }
            
            
        }
        else // Add Mode
        {
            // Determine if String or Number is selected
            if(dataTypeSegmented.selectedSegmentIndex == 0)
            {
                // Step 4: Choose working entity (Name of Entity in Core Data
                let entity = NSEntityDescription.entity(forEntityName: "StringDemo", in: context)
                
                // Step 5: Create command with Values
                let stringDemo = NSManagedObject(entity:entity!, insertInto:context)
                stringDemo.setValue(dataTypeTextField.text, forKeyPath:"stringEntered")
                
                do
                {
                    // Step 6: Execute Command
                    try context.save()
                    self.delegate?.didAddString()
                    self.navigationController?.popViewController(animated: true)
                }
                catch let error as NSError
                {
                    print("display error - \(error)")
                }
            }
            else // Adding number to NumberDemo
            {
                // Step 4: Choose working entity (Name of Entity in Core Data
                let entity = NSEntityDescription.entity(forEntityName: "NumberDemo", in: context)
                
                // Step 5: Create command with Values
                let numberDemo = NSManagedObject(entity:entity!, insertInto:context)
                numberDemo.setValue(dataTypeTextField.text, forKeyPath:"numberEntered")
                
                do
                {
                    // Step 6: Execute Command
                    try context.save()
                    self.delegate?.didAddNumber()
                    self.navigationController?.popViewController(animated: true)
                }
                catch let error as NSError
                {
                    print("display error - \(error)")
                }
            }
        } // END of Add/Update Logic
    } // END of addButtonPressed
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dataTypeSegmentedChanged(_ sender: Any) {
        if(dataTypeSegmented.selectedSegmentIndex == 0){
            dataTypeTextField.placeholder = "Enter a String"
        }else{
            dataTypeTextField.placeholder = "Enter a Number"
        }
    }
    
    // Delegate
    
    // Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = self.indexPath,
            let entityToUpdate = self.entityToUpdate
        {
            self.title = "Update"
            self.addEditButton.setTitle("Update", for: .normal)
            
            if(indexPath.section == 0){
                self.dataTypeSegmented.setEnabled(false, forSegmentAt: 1)
                dataTypeTextField.text = entityToUpdate.value(forKeyPath: "stringEntered") as? String
            }else{
                self.dataTypeSegmented.setEnabled(false, forSegmentAt: 0)
                dataTypeTextField.text = entityToUpdate.value(forKeyPath: "numberEntered") as? String
            }
            
            self.dataTypeSegmented.selectedSegmentIndex = indexPath.section
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
