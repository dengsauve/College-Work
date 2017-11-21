//
//  DemoTableViewController.swift
//  Core-Data-Demo
//
//  Created by Dennis Sauve on 10/29/17.
//  Copyright © 2017 Dennis Sauve. All rights reserved.
//

import UIKit
import CoreData

class DemoTableViewController: UITableViewController, AddDemoViewControllerDelegate {
    
    // Variables
    var arrayOfStrings:[NSManagedObject] = []
    var arrayOfNumbers:[NSManagedObject] = []
    
    //Optionals for Segue
    var indexPath: IndexPath?
    var entityToUpdate: NSManagedObject?
    
    // Outlets
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    // Actions
    @IBAction func editButtonPressed(_ sender: Any) {
        editingMode()
    }
    
    // Delegates
    
    func didAddString() {
        print("Did add string called")
        
        retrieveStrings()
        self.tableView.reloadData()
    }
    
    func didAddNumber() {
        print("Did add number called")
        
        retrieveNumbers()
        self.tableView.reloadData()
    }
    
    func didUpdate(){
        retrieveNumbers()
        retrieveStrings()
        self.tableView.reloadData()
        self.indexPath = nil
    }
    
    func retrieveStrings(){
        //2
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            print ("Display Error")
            return
        }
        
        //3
        let context = appDelegate.persistentContainer.viewContext
        
        //4
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "StringDemo")
        
        //5
        do
        {
            arrayOfStrings = try context.fetch(fetchRequest)
            editButton.isEnabled = arrayOfStrings.count > 0 ? true : false
        }
        catch let error as NSError
        {
            print("error \(error)")
        }
    }
    
    func retrieveNumbers(){
        //2
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            print ("Display Error")
            return
        }
        
        //3
        let context = appDelegate.persistentContainer.viewContext
        
        //4
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "NumberDemo")
        
        //5
        do
        {
            arrayOfNumbers = try context.fetch(fetchRequest)
            editButton.isEnabled = arrayOfNumbers.count > 0 ? true : false
        }
        catch let error as NSError
        {
            print("error \(error)")
        }
    }
    
    func editingMode(){
        
        if(arrayOfStrings.count == 0){
            tableView.isEditing = false
            print(tableView.isEditing)
            editButton.isEnabled = false
        }else{
            tableView.isEditing = !tableView.isEditing
        }
        
        editButton.title = tableView.isEditing ? "Cancel" : "Edit"
        addButton.isEnabled = !tableView.isEditing
        
        tableView.reloadData()
    }
    
    
    // Overrides
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let addDemoViewController = segue.destination as! AddDemoViewController
        
        if let indexPath = indexPath,
            let entityToUpdate = entityToUpdate{
            addDemoViewController.indexPath = indexPath
            addDemoViewController.entityToUpdate = entityToUpdate
        }
        
        addDemoViewController.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        retrieveStrings()
        retrieveNumbers()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == 0){
            return arrayOfStrings.count == 0 ? 1 : arrayOfStrings.count
        }else{
            return arrayOfNumbers.count == 0 ? 1 : arrayOfNumbers.count
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        //cell.textLabel?.text = "Section #\(indexPath.section) - Row #\(indexPath.row)";
        
        if(indexPath.section == 0)
        {
            if(arrayOfStrings.count == 0)
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "notFoundCellIdentifier", for: indexPath)
                cell.textLabel?.text = "No Strings Found"
                return cell
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "demoCellIdentifier", for: indexPath)
                
                // Core Data
                let stringRow = arrayOfStrings[indexPath.row]
                cell.textLabel?.text = stringRow.value(forKeyPath: "stringEntered") as? String
                
                //cell.textLabel?.text = "\(arrayOfStrings[indexPath.row])"
                cell.detailTextLabel?.text = "String"
                return cell
            }
        }
        else if(indexPath.section == 1)
        {
            if (arrayOfNumbers.count == 0)
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "notFoundCellIdentifier", for: indexPath)
                cell.textLabel?.text = "No Integers Found"
                return cell
            }
            else
            {
                let numberRow = arrayOfNumbers[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: "demoCellIdentifier", for: indexPath)
                
                cell.textLabel?.text = numberRow.value(forKeyPath:"numberEntered") as? String
                cell.detailTextLabel?.text = "Number"
                
                return cell
            }
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "notFoundCellIdentifier", for: indexPath)
            cell.textLabel?.text = "Nothing Found"
            return cell
        }
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return indexPath.section == 0
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            // tableView.deleteRows(at: [indexPath], with: .fade)
            //arrayOfStrings.remove(at: indexPath.row)
            
            //2
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
                print("Display Error")
                return
            }
            
            //3
            let context = appDelegate.persistentContainer.viewContext
            
            //4
            context.delete(arrayOfStrings[indexPath.row])
            
            //5
            do
            {
                try context.save()
                arrayOfStrings.remove(at: indexPath.row)
            }
            catch let error as NSError
            {
                print("error \(error)")
            }
            
            tableView.reloadData()
            print(arrayOfStrings.count)
            if(arrayOfStrings.count == 0){
                DispatchQueue.main.async {
                    self.editingMode()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.section == 0){
            self.entityToUpdate = arrayOfStrings[indexPath.row]
        }else{
            self.entityToUpdate = arrayOfNumbers[indexPath.row]
        }
        
        self.indexPath = indexPath
        
        self.performSegue(withIdentifier: "addUpdateSegue", sender: self)
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
