//
//  TransferView.swift
//  SeerBit-SDK
//
//  Created by Princess on 23/03/2023.
//

import SwiftUI

struct TransferView: View {
    @ObservedObject var viewModel: TransferViewModel
    private let pasteboard = UIPasteboard.general
    
    var model: TransferModel
    var body: some View {
        VStack {
            HeaderView(userName: viewModel.userName, userEmail: viewModel.userEmail)
                .padding(.top, 40)
                    
            Text("Transfer the exact amount including decimals")
                    .padding(.top, 25)
                    .foregroundColor(Color.red)
            
            VStack {
                Text("\(viewModel.currencyToPayIn) \(model.amountToTransfer.delimiter)")
                    .fontWeight(.heavy)
                    .font(.system(size: 30))
            }
            .frame(width: 210, height: 25)
            .padding()
            .background(Color(uiColor: ImageProvider.color(named: "secondaryButtonColor") ?? UIColor()))
            .cornerRadius(7)
            .padding(.bottom, 5)
            
            Text("to")
                .fontWeight(.heavy)
                .font(.system(size: 20))

            VStack(spacing: 12) {
                HStack {
                    Text("Account Number")
                        .font(.system(size: 17))
                    Spacer()
                    Text(model.accountNumber)
                        .font(.system(size: 17))
                    Button {
                        pasteboard.string = model.accountNumber
                    } label: {
                        Image(uiImage: ImageProvider.image(named: "shareBtn") ?? UIImage())
                            .resizable()
                            .frame(width: 15, height: 20)
                    }
                }
                HStack {
                    Text("Bank")
                        .font(.system(size: 17))
                    Spacer()
                    Text(model.bank)
                        .font(.system(size: 17))
                }
                HStack {
                    Text("Beneficiary")
                        .font(.system(size: 17))
                    Spacer()
                    Text(model.beneficiary)
                        .font(.system(size: 15))
                }
                HStack {
                    Text("Validity")
                        .font(.system(size: 17))
                    Spacer()
                    Text(model.validity)
                        .font(.system(size: 17))
                }
            }
            .frame(width: 330, height: 125)
            .padding()
            .background(Color(uiColor: ImageProvider.color(named: "secondaryButtonColor") ?? UIColor()))
            .cornerRadius(7)
            .padding(.bottom, 5)
            
            Text("Account Number can only be used once")
                .foregroundColor(Color.red)
                .padding(.bottom)
            
            PrimaryButton(title: "I have completed this bank transfer", width: 355, height: 55) {
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
}

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView(viewModel: TransferViewModel(), model: TransferModel.example)
    }
}
