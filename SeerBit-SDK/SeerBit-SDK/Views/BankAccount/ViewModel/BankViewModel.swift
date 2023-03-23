//
//  BankViewModel.swift
//  SeerBit-SDK
//
//  Created by Princess on 16/03/2023.
//

import Foundation
import UIKit
//import SDWebImageSwiftUI


class BankViewModel: ObservableObject {
    @Published var amountToPay: Double = 0.0
    @Published var surchageFee: Double = 0.0
    @Published var currencyToPayIn: String = "NGN"
    @Published var userName: String = "Tola Shimbo"
    @Published var userEmail: String = "omotola.sambo@seerbit.om"
    @Published var bankSelected: AllBanksModel? = nil
    @Published var bankCodeGenerated: String = "*737*000*99099#"
//
//    func copyString(string: String, item: String){
//        UIPasteboard.general.string = string
//        SystemGesture.hapticFeedback()
//        NotificationManager.ToastMessage(message: "\(item) copied")
//    }
}
