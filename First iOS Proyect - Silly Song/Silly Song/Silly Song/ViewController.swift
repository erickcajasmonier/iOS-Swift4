//
//  ViewController.swift
//  Silly Song
//
//  Created by Erick Diego Cajas Monier on 12/2/17.
//  Copyright © 2017 Erick Diego Cajas Monier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func resetLyrics(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        //textFieldShouldReturn(nameField)
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
    }
    
    
    //Method to extract shortNameFromName
    func shortNameFromName(_ name: String) -> String {
        
        let i = name.startIndex
        var lowercaseName = name.lowercased()
        lowercaseName.remove(at: i)
        //let vowelSet = CharacterSet(charactersIn: name)
        return lowercaseName
        //return converted
        
    }
    //shortNameFromName("Erick")
    
    
    //Integrating the last method
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        
        /*
         let bananaFanaTemplate = [
         fullName+", "+fullName+", Bo B"+shortNameFromName(fullName),
         "Banana Fana Fo F"+shortNameFromName(fullName),
         "Me My Mo M"+shortNameFromName(fullName),
         fullName].joined(separator: "\n")
         */
        
        var replaceFullName = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        
        var replaceShortName = replaceFullName.replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(fullName))
        
        return replaceShortName
    }
    //print(lyricsForName(lyricsTemplate: bananaFanaTemplate,fullName: "Erick"))}
    
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
