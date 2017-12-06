//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Method to extract shortNameFromName
func shortNameFromName(_ name: String) -> String {
    
    let i = name.startIndex
    var lowercaseName = name.lowercased()
    lowercaseName.remove(at: i)
    //let vowelSet = CharacterSet(charactersIn: name)
    return lowercaseName
    //return converted
    
}
shortNameFromName("Erick")


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
print(lyricsForName(lyricsTemplate: bananaFanaTemplate,fullName: "Erick"))
