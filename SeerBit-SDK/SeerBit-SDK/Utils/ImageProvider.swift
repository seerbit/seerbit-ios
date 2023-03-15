//
//  ImageProvider.swift
//  SeerBit-SDK
//
//  Created by Princess on 13/03/2023.
//

import Foundation
import UIKit

public class ImageProvider {
    // convenient for specific image
    public static func picture() -> UIImage {
        return UIImage(named: "picture", in: Bundle(for: self), with: nil) ?? UIImage()
    }

    // for any image located in bundle where this class has built
    public static func image(named: String) -> UIImage? {
        return UIImage(named: named, in: Bundle(for: self), with: nil)
    }
    
    public static func color(named: String) -> UIColor? {
        return UIColor(named: named, in: Bundle(for: self), compatibleWith: nil)
    }
}

 
