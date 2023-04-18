//
//  OTPView.swift
//  SeerBit-SDK
//
//  Created by Princess on 13/03/2023.
//

import SwiftUI

struct OTPView: View {
    @ObservedObject var viewModel: CardViewModel
    var completed: (_ pin: String) -> Void = { _ in }
    var dismiss: () -> Void = {}
    
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
           
            Text("Kindly enter the OTP sent to your mobile number or email")
                .padding()
                .multilineTextAlignment(.center)
            
            PassCodeView(type: .otp) { otp in
                if otp.count == 6 {
                    completed(otp)
                }
            }
            
            HStack {
                Spacer()
                Button {
                    dismiss()
                   //resend otp endpoint
                } label: {
                    Text("Resend OTP")
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .medium))
                        .padding(.top)
                }
            }
            .padding(.trailing, 20)
            
            PrimaryButton(title: "Authorize Payment", width: 350, height: 55, validated: false) {
                //
            }
            .padding([.top, .bottom])
            Spacer()
        }
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView(viewModel: CardViewModel())
    }
}
