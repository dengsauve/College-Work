//
//  PlayersViewController.swift
//  RO-SHAM-BILL
//
//  Created by Dennis Sauve on 12/11/17.
//  Copyright © 2017 Dennis Sauve. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    //MARK: Structs
    struct players: Codable{
        let number:Int
    }
    
    //MARK: Variables
    let rangeArray = Array(2...50)
    var numberOfPlayers = 2
    
    //MARK: Outlets
    @IBOutlet weak var playersPickerView: UIPickerView!
    
    //MARK: Actions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        // Save number of players
        let newPlayers = players(number: numberOfPlayers)
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("players").appendingPathExtension("plist")
        
        let propertyListEncoder = PropertyListEncoder()
        let encodedSettings = try? propertyListEncoder.encode(newPlayers)
        
        try? encodedSettings?.write(to: archiveURL, options: .noFileProtection)
        
        // Segue to next view
        performSegue(withIdentifier: "playersToGame", sender: self)
    }
    
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playersPickerView.dataSource = self
        playersPickerView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Stubs
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rangeArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(rangeArray[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberOfPlayers = rangeArray[row]
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
