//
//  AuthenticateWithBank.swift
//  SeerBit-SDK
//
//  Created by Princess on 13/03/2023.
//

import SwiftUI

struct AuthenticateWithBank: View {
    @ObservedObject var viewModel: CardViewModel
    
    var body: some View {
        VStack {
            HeaderView(userName: "Tola Sambo", userEmail: "omotola.sambo@seerbit.om")
                .padding(.top, 20)
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("$\(viewModel.amountToPay.delimiter)")
                        .bold()
                        .font(.system(size: 30))
                        .padding(.top)
                        
                    HStack {
                        Text("surcharge")
                            .font(.system(size: 15))
                        Text("$\(viewModel.surchageFee.delimiter)")
                    }
                }
               Spacer()
            }
            .padding(.leading)
           
            Text("Please click the button below to authenticate with your bank ")
                .padding()
                .multilineTextAlignment(.center)
            
            PrimaryButton(title: "Authorize Payment", width: 350, height: 55) {
                //
            }
            .padding(.top)
            Spacer()
        }
    }
}

struct AuthenticateWithBank_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticateWithBank(viewModel: CardViewModel())
    }
}
