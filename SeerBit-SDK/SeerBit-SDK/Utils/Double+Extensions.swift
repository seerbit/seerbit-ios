//
//  Double+Extensions.swift
//  SeerBit-SDK
//
//  Created by Princess on 10/03/2023.
//

import Foundation

extension Double {
    
    var delimiter: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let groupingSeparator = ","
        // formatter.positiveFormat = "###,###"
        // formatter.negativeFormat = "-###,###"
        numberFormatter.groupingSeparator = groupingSeparator
        return "\(numberFormatter.string(from: NSNumber(value: self)) ?? "0")"
    }
}


