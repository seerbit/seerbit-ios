//
//  AccountView.swift
//  SeerBit-SDK
//
//  Created by Princess on 16/03/2023.
//

import SwiftUI

struct AccountView: View {
    @ObservedObject var viewModel: BankViewModel
    @State private var accountNumber = ""
    let accountNumberLimit = 10
    var accountNumberIsValid = false
//
//    private var validated: Bool {
//        if accountNumber.isEmpty && accountNumberIsValid == false {
//            return false
//        }
//        return true
//     }
    
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
                    Text("Enter your \(viewModel.bankSelected?.bankName ?? "") account number")
                        .padding(.top, 25)
                    Spacer()
                }
                .padding(.leading)
            
            VStack {
                 TextField("10 digits bank account number", text: $accountNumber)
                    .onChange(of: accountNumber, perform: { newValue in
                        limitText(accountNumberLimit)
                    })
                     .padding()
                     .border(Color.gray, width: 0.5)
                     .padding([.leading, .trailing, .bottom])
                     .keyboardType(.numberPad)
            }
            
            PrimaryButton(title: "Verify Account", width: 365, height: 55, validated: false) {
                //
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
    }
    
    
    func limitText(_ upper: Int)  {
           if accountNumber.count > upper {
               accountNumber = String(accountNumber.prefix(upper))
           }
       }

}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(viewModel: BankViewModel())
    }
}
