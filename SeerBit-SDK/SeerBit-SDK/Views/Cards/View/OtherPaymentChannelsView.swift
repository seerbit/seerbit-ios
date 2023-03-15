//
//  OtherPaymentChannelsView.swift
//  SeerBit-SDK
//
//  Created by Princess on 13/03/2023.
//

import SwiftUI

struct OtherPaymentChannelsView: View {
    @ObservedObject var viewModel: CardViewModel
    
    var body: some View {
        VStack {
            HeaderView(userName: "Tola Sambo", userEmail: "omotola.sambo@seerbit.om")
                .padding(.top, 10)
            
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
            
            VStack {
                HStack {
                    Text("Other Payment Channels")
                        .padding([.top, .leading])
                    Spacer()
                }
                CustomButtonGray2(title: "Bank Account", width: 350, height: 55) {
                    //
                }
                CustomButtonGray2(title: "Transfer", width: 350, height: 55) {
                    //
                }
                CustomButtonGray2(title: "USSD                                       *bank USSD code", width: 350, height: 55) {
                    //
                }
                CustomButtonGray2(title: "Phone Number", width: 350, height: 55) {
                    //
                }
                CustomButtonGray2(title: "Cash                                Nearest Mobile Agents", width: 350, height: 55) {
                    //
                }
            }
            
            CustomButtonRed(title: "Cancel Payment", width: 155, height: 55) {
                //
            }
            .padding([.top, .bottom])
            
            HStack {
                Image(uiImage: ImageProvider.image(named: "lockIcon") ?? UIImage())
                    .resizable()
                    .frame(width: 15, height: 20)
                Image(uiImage: ImageProvider.image(named: "Secured-by-SeerBit") ?? UIImage())
            }
            
        }
    }
}

struct OtherPaymentChannelsView_Previews: PreviewProvider {
    static var previews: some View {
        OtherPaymentChannelsView(viewModel: CardViewModel())
    }
}
