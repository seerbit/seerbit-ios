//
//  BankHomeView.swift
//  SeerBit-SDK
//
//  Created by Princess on 16/03/2023.
//

import SwiftUI

struct BankHomeView: View {
    @ObservedObject var viewModel: BankViewModel
    
    private var validated: Bool {
        if viewModel.bankSelected != nil {
            return true
        }
        return false
    }
    var body: some View {
        VStack {
            HeaderView(userName: viewModel.userName, userEmail: viewModel.userEmail)
                .padding(.top, 40)
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(viewModel.currencyToPayIn) \(viewModel.amountToPay.delimiter)")
                        .bold()
                        .font(.system(size: 30))
                        .padding(.top)
                    
                    HStack {
                        Text("surcharge")
                            .font(.system(size: 15))
                        Text("\(viewModel.currencyToPayIn) \(viewModel.surchageFee.delimiter)")
                            .font(.system(size: 15))
                    }
                }
                Spacer()
            }
            .padding(.leading)
            
            HStack {
                Text("Choose your bank to start this payment")
                    .padding(.top, 25)
                Spacer()
            }
            .padding(.leading)
            DropdownMenu(selectedBank: $viewModel.bankSelected, placeHolder: "Select Bank", banks: viewModel.merchantBanks) { bank in
                //
            }
            .padding(.bottom)
            
            PrimaryButton(title: "Pay \(viewModel.currencyToPayIn) \((viewModel.amountToPay + viewModel.surchageFee).delimiter)", width: 365, height: 55, validated: validated) {
                // navigate to next page 
            }
            
            HStack {
                Image(uiImage: ImageProvider.image(named: "lockIcon") ?? UIImage())
                    .resizable()
                    .frame(width: 15, height: 20)
                Image(uiImage: ImageProvider.image(named: "Secured-by-SeerBit") ?? UIImage())
            }
            .padding(.top,25)
            
            Spacer()
        }
        .onAppear {
            viewModel.getAllBanks()
        }
    }
    
}

struct BankHomeView_Previews: PreviewProvider {
    static var previews: some View {
        BankHomeView(viewModel: BankViewModel())
    }
}

