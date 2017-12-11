//
//  SettingsTableViewController.swift
//  RO-SHAM-BILL
//
//  Created by Dennis Sauve on 12/11/17.
//  Copyright © 2017 Dennis Sauve. All rights reserved.
//

import UIKit


class SettingsTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //MARK: Variables
    let rangeArray = Array(1...1000)
    var rangeStart:Int = 0
    var rangeEnd:Int = 0
    
    //MARK: Stucts
    struct rsbSetting: Codable{
        let startInt: Int
        let endInt: Int
    }
    
    //MARK: Outlets
    @IBOutlet weak var rangeStartPicker: UIPickerView!
    @IBOutlet weak var rangeEndPicker: UIPickerView!
    @IBOutlet weak var warningLabel: UILabel!
    
    //MARK: Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        if( rangeStart < rangeEnd ){
            let newSettings = rsbSetting(startInt: rangeStart, endInt: rangeEnd)
            
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let archiveURL = documentsDirectory.appendingPathComponent("rsb_settings").appendingPathExtension("plist")
            
            let propertyListEncoder = PropertyListEncoder()
            let encodedSettings = try? propertyListEncoder.encode(newSettings)
            
            try? encodedSettings?.write(to: archiveURL, options: .noFileProtection)
            
            
            self.dismiss(animated: true, completion: nil)
        }else{
            warningLabel.text = "Start must be less than End."
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        warningLabel.text = ""
        
        rangeStartPicker.dataSource = self
        rangeEndPicker.dataSource = self
        
        rangeStartPicker.delegate = self
        rangeEndPicker.delegate = self
        
        // Grab any saved settings
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("rsb_settings").appendingPathExtension("plist")
        
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedSettingsData = try? Data(contentsOf: archiveURL),
            let decodedSetting = try? propertyListDecoder.decode(rsbSetting.self, from: retrievedSettingsData) {
            //print(decodedSetting)
            rangeStart = decodedSetting.startInt
            rangeEnd = decodedSetting.endInt
            
            rangeStartPicker.selectRow(rangeStart - 1, inComponent: 0, animated: false)
            rangeEndPicker.selectRow(rangeEnd - 1, inComponent: 0, animated: false)
        }
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rangeArray.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(rangeArray[row])
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView.tag == 0){
            rangeStart = rangeArray[row]
        }
        else{
            rangeEnd = rangeArray[row]
        }
        if( rangeStart >= rangeEnd ){
            warningLabel.text = "Start must be less than End."
        }
        else{
            warningLabel.text = ""
        }
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
