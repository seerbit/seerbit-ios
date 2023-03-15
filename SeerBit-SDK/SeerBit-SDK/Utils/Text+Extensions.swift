//
//  Text+Extensions.swift
//  SeerBit-SDK
//
//  Created by Princess on 10/03/2023.
//

import Foundation
import SwiftUI

extension Text {


        func faktSemiBold(size: CGFloat) -> some View {
            self.font(.custom("fakt-smbd", size: size))
        }

        func faktThin(size: CGFloat) -> some View {
            self.font(.custom("fakt-th", size: size))
        }
        
        func faktLight(size: CGFloat) -> some View {
            self.font(.custom("fakt-lt", size: size))
        }
        
//        func poppinsSemibold(size: CGFloat) -> some View {
//            self.font(.custom("Poppins-SemiBold", size: size))
//        }
        
//        func poppinsBlack(size: CGFloat) -> some View {
//            self.font(.custom("Poppins-Black", size: size))
//        }
//
//        func poppinsMedium(size: CGFloat) -> some View {
//            self.font(.custom("Poppins-Medium", size: size))
//        }
    
}

