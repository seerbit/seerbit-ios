//
//  TransferViewModel.swift
//  SeerBit-SDK
//
//  Created by Princess on 23/03/2023.
//

import Foundation


class TransferViewModel: ObservableObject {
    @Published var userName: String = "Tola Shimbo"
    @Published var userEmail: String = "omotola.sambo@seerbit.om"
    @Published var amountToTransfer: Double = 0.0
    @Published var currencyToPayIn: String = "NGN"
    @Published var surchageFee: Double = 0.0
    
}
