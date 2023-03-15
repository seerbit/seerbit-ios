//
//  String+Extensions.swift
//  SeerBit-SDK
//
//  Created by Princess on 10/03/2023.
//

import Foundation
import UIKit


extension String {
    func formattedCardNumber() -> String {
        var formattedString = ""
        let maxLength = 19
        let allowedCharacters = CharacterSet.decimalDigits

        for (i, character) in self.enumerated() {
            if i == maxLength {
                break
            }
            if allowedCharacters.contains(UnicodeScalar(String(character))!) {
                formattedString.append(character)
                if formattedString.count == 4 || formattedString.count == 9 || formattedString.count == 14 {
                    formattedString.append(" ")
                }
            }
        }

        return formattedString
    }
    
}


extension String {
    func applyPattern(pattern: String = "#### #### #### ####", replacmentCharacter: Character = "#") -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: self)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacmentCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
    
   
}

extension String {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        //Range.Lenth will greater than 0 if user is deleting text - Allow it to replce
        if range.length > 0
        {
            if range.location == 3 {
               var originalText = textField.text
               originalText = originalText?.replacingOccurrences(of: "/", with: "")
               textField.text = originalText
            }
            return true
        }

        //Dont allow empty strings
        if string == " "
        {
            return false
        }

        //Check for max length including the spacers we added
        if range.location >= 5
        {
            return false
        }

        var originalText = textField.text
        let replacementText = string.replacingOccurrences(of: " ", with: "")

        //Verify entered text is a numeric value
        let digits = NSCharacterSet.decimalDigits
        for char in replacementText.unicodeScalars {
    //        if !digits.longCharacterIsMember(char.value) {
    //            return false
    //        }
            if !digits.contains(char) {
                return false
            }
        }

        //Put / space after 2 digit
        if range.location == 2
        {
            originalText?.append(contentsOf: "/")
            textField.text = originalText
        }

        return true
    }
}

//
//extension String {
//    func checkExpiryDate(date: String) -> String {
//        var cleanString = date.replacingOccurrences(of: "/", with: "")
//            
//            if cleanString.rangeOfCharacter(from: unsupportedCharacterSet) != nil {
//                return ""
//            }
//            
//            let dateString: String
//            
//            if cleanString.count == 0 {
//                return string
//            } else if cleanString.count > 4 {
//                // trim the string down to 4
//                
//                let reqIndex = cleanString.index(cleanString.startIndex, offsetBy: 4)
//                cleanString = String(cleanString[..<reqIndex])
//                
//            }
//            
//            if cleanString.hasPrefix("0") == false && cleanString.hasPrefix("1") == false {
//                dateString = "0" + cleanString
//            } else {
//                dateString = cleanString
//            }
//            let currentYear = Calendar.current.component(.year, from: Date()) % 100   // This will give you current year (i.e. if 2019 then it will be 19)
//              let currentMonth = Calendar.current.component(.month, from: Date()) // This will give you current month (i.e if June then it will be 6)
//            var newText = ""
//            for (index, character) in dateString.enumerated() {
//                print("index: \(index)")
//                if index == 1 {
//                    let enterdMonth = Int(dateString.prefix(2)) ?? 0  // get first two digit from entered string as month
//                    print("enterdMonth at 1:\(enterdMonth)")
//                    if (1 ... 12).contains(enterdMonth){
//                        if enterdMonth < 10 {
//                            newText = "0" + "\(enterdMonth)" + "/"
//                        }else {
//                            newText = "\(enterdMonth)" + "/"
//                        }
//                    }else{
//                        
//                    }
//                }else if index == 2 {
//                    if (2 ... 99).contains(Int(String(character))!) { // Entered year should be greater than 2019.
//                        newText.append(character)
//                    }else{
//                        
//                    }
//                }else if index == 3 {
//                    print("index---: \(index)")
//                    let enterdYr = Int(dateString.suffix(2)) ?? 0   // get last two digit from entered string as year
//                    let enterdMonth = Int(dateString.prefix(2)) ?? 0  // get first two digit from entered string as month
//                    print("enterdYr: \(enterdYr)")
//                    print("currentYear: \(currentYear)")
//                    if (2 ... 99).contains(enterdYr) { // Entered year should be greater than 2019
//                        if enterdYr >= currentYear {
//                            if (1 ... 12).contains(enterdMonth) {
//                                if enterdMonth < 10 {
//                                    newText = "0" + "\(enterdMonth)" + "/" + "\(enterdYr)"
//                                }else {
//                                    newText = "\(enterdMonth)" + "/" + "\(enterdYr)"
//                                }
//                                return newText
//                            }
//                        }
//                    }
//                }
//                else {
//                    newText.append(character)
//                }
//            }
//            return newText
//        }
//    }
//}
