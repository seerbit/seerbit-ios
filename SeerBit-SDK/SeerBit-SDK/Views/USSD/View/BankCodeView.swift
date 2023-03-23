//
//  BankCodeView.swift
//  SeerBit-SDK
//
//  Created by Princess on 18/03/2023.
//

import SwiftUI

struct BankCodeView: View {
    @ObservedObject var viewModel: BankViewModel
    private let pasteboard = UIPasteboard.general
    
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
                    Text("Dial the code below to complete this payment")
                        .padding(.top, 25)
                    Spacer()
                }
                .padding(.leading)
            VStack {
                Text(viewModel.bankCodeGenerated)
                    .fontWeight(.heavy)
                    .font(.system(size: 30))
            }
            .frame(width: 330, height: 35)
            .padding()
            .background(Color(uiColor: ImageProvider.color(named: "secondaryButtonColor") ?? UIColor()))
            .cornerRadius(7)
            .padding(.bottom)
           
            Button {
                pasteboard.string = viewModel.bankCodeGenerated
            } label: {
                Text("Click to copy code")
                    .foregroundColor(.black)
            }
            .padding(.bottom)
               
            PrimaryButton(title: "Confirm Payment", width: 355, height: 55) {
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

struct BankCodeView_Previews: PreviewProvider {
    static var previews: some View {
        BankCodeView(viewModel: BankViewModel())
    }
}
