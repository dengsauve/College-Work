//
//  ServerViewController.swift
//  RO-SHAM-BILL
//
//  Created by Dennis Sauve on 12/11/17.
//  Copyright © 2017 Dennis Sauve. All rights reserved.
//

import UIKit

class ServerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //MARK: Variables
    var startNumber:Int = 0
    var endNumber:Int = 0
    var targetNumber:Int = 0
    var rangeArray:[Int] = []
    
    
    //MARK: Stucts
    struct rsbSetting: Codable{
        let startInt: Int
        let endInt: Int
    }
    
    struct target: Codable{
        let targetInt: Int
    }
    
    //MARK: Outlets
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var targetPicker: UIPickerView!
    
    //MARK: Actions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        // Save Target
        let newTarget = target(targetInt: targetNumber)
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("targetNumber").appendingPathExtension("plist")
        
        let propertyListEncoder = PropertyListEncoder()
        let encodedSettings = try? propertyListEncoder.encode(newTarget)
        
        try? encodedSettings?.write(to: archiveURL, options: .noFileProtection)
        
        // Hide Picker
        targetPicker.isHidden = true
        
        // Perform Segue to Next View
        self.performSegue(withIdentifier: "serverToPlayers", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        targetPicker.dataSource = self
        targetPicker.delegate = self

        // Grab saved settings
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("rsb_settings").appendingPathExtension("plist")
        
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedSettingsData = try? Data(contentsOf: archiveURL),
            let decodedSetting = try? propertyListDecoder.decode(rsbSetting.self, from: retrievedSettingsData) {
            //print(decodedSetting)
            startNumber = decodedSetting.startInt
            endNumber = decodedSetting.endInt
        }
        
        promptLabel.text = "Choose a number\nbetween \(startNumber) and \(endNumber)"
        
        rangeArray = Array(startNumber...endNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(rangeArray[row])
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        targetNumber = rangeArray[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rangeArray.count
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
