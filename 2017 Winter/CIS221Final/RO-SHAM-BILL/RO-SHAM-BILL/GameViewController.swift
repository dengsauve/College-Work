//
//  GameViewController.swift
//  RO-SHAM-BILL
//
//  Created by Dennis Sauve on 12/11/17.
//  Copyright © 2017 Dennis Sauve. All rights reserved.
//

import UIKit
import CoreData

class GameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //MARK: Variables
    var high = 0
    var low = 0
    var targetNumber = 0
    var rangeArray:[Int] = []
    var guess = 0
    var numberOfPlayers = 2
    var currentPlayer = 1
    var gameId = String(NSDate().timeIntervalSince1970)
    var newGame: NSManagedObject?
    
    //MARK:Structs
    struct rsbSetting: Codable{
        let startInt: Int
        let endInt: Int
    }
    
    struct players: Codable{
        let number:Int
    }
    
    struct target: Codable{
        let targetInt: Int
    }
    
    //MARK: Actions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func guessButtonTapped(_ sender: Any) {
        // Too high/low - Adjust Range, reload picker
        if(guess < targetNumber){
            lowRangeLabel.text = "Low: \(guess)"
            low = guess
            rangeArray = Array(low...high)
            numberPickerView.reloadAllComponents()
            numberPickerView.selectRow(0, inComponent: 0, animated: false)
        }else if(guess > targetNumber){
            // Save High Guess
            highRangeLabel.text = "High: \(guess)"
            high = guess
            rangeArray = Array(low...high)
            numberPickerView.reloadAllComponents()
            let lastRowIndex = rangeArray.count - 1
            numberPickerView.selectRow(lastRowIndex, inComponent: 0, animated: false)
            
        }else{
            playerPrompt.text = "Player \(currentPlayer) is the Winner!"
            winnerLabel.text = "Winner: \(guess)"
            guessButton.isEnabled = false
            numberPickerView.isHidden = true
        }
        
        // Proceed to Next Player
        if(guessButton.isEnabled){
            if(currentPlayer < numberOfPlayers){
                currentPlayer += 1
                playerPrompt.text = "Player \(currentPlayer), Pick a Number"
            }else{
                currentPlayer = 1
                playerPrompt.text = "Player \(currentPlayer), Pick a Number"
            }
        }
        
        // Catalog the Move - Game, Player, Number, Winner(bool)
        
        // Step 2: Create instance of AppDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            print ("Error on Step 2")
            return
        }
        
        // Step 3: Create ORM Context
        let context = appDelegate.persistentContainer.viewContext
        
        // Step 4: Choose working entity
        let entity = NSEntityDescription.entity(forEntityName: "Move", in: context)
        
        // Step 5: Create Command with Values
        let newMove = NSManagedObject(entity: entity!, insertInto: context)
        newMove.setValue(String(guess), forKey: "number")
        newMove.setValue(String(currentPlayer), forKey: "player")
        newMove.setValue(guess == targetNumber, forKey: "winner")
        newMove.setValue(gameId, forKey: "id")
        
        do
        {
            // Setp 6: Execute the Command
            try context.save()
        }
        catch let error as NSError
        {
            print("Error in Step 6: \(error)")
        }
    }
    
    //MARK: Outlets
    @IBOutlet weak var numberPickerView: UIPickerView!
    @IBOutlet weak var playerPrompt: UILabel!
    @IBOutlet weak var lowRangeLabel: UILabel!
    @IBOutlet weak var highRangeLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        playerPrompt.text = "Player 1, Pick a Number"
        winnerLabel.text = ""

        numberPickerView.dataSource = self
        numberPickerView.delegate = self

        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let propertyListDecoder = PropertyListDecoder()

        // Load Number of Players
        var archiveURL = documentsDirectory.appendingPathComponent("players").appendingPathExtension("plist")
        if let retrievedSettingsData = try? Data(contentsOf: archiveURL),
            let decodedPlayers = try? propertyListDecoder.decode(players.self, from: retrievedSettingsData) {
                numberOfPlayers = decodedPlayers.number
        }
        
        // Load Target Number
        archiveURL = documentsDirectory.appendingPathComponent("targetNumber").appendingPathExtension("plist")
        if let retrievedSettingsData = try? Data(contentsOf: archiveURL),
            let decodedTarget = try? propertyListDecoder.decode(target.self, from: retrievedSettingsData) {
                targetNumber = decodedTarget.targetInt
        }
        
        // Load Range
        archiveURL = documentsDirectory.appendingPathComponent("rsb_settings").appendingPathExtension("plist")
        if let retrievedSettingsData = try? Data(contentsOf: archiveURL),
            let decodedSetting = try? propertyListDecoder.decode(rsbSetting.self, from: retrievedSettingsData) {
                low = decodedSetting.startInt
                lowRangeLabel.text = "Low: \(low)"
                guess = low
                high = decodedSetting.endInt
                highRangeLabel.text = "High: \(high)"
                rangeArray = Array(low...high)
        }
        numberPickerView.reloadAllComponents()
        
        // Catalog the Game - datetime, id, target
        
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        
        // Step 2: Create instance of AppDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            print ("Error on Step 2")
            return
        }
        
        // Step 3: Create ORM Context
        let context = appDelegate.persistentContainer.viewContext
        
        // Step 4: Choose working entity
        let entity = NSEntityDescription.entity(forEntityName: "Game", in: context)
        
        // Step 5: Create Command with Values
        newGame = NSManagedObject(entity: entity!, insertInto: context)
        newGame!.setValue(dateString, forKey: "datetime")
        newGame!.setValue(gameId, forKey: "id")
        newGame!.setValue(String(targetNumber), forKey: "target")
        
        do
        {
            // Setp 6: Execute the Command
            try context.save()
        }
        catch let error as NSError
        {
            print("Error in Step 6: \(error)")
        }
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
        guess = rangeArray[row]
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
