//
//  MobilePaymentView.swift
//  SeerBit-SDK
//
//  Created by Princess on 06/04/2023.
//

import SwiftUI

struct MobilePaymentView: View {
    @ObservedObject var viewModel: MomoViewModel
    @State private var phoneNumber = ""
    @State var isPresenting = false
    let phoneNumberLimit = 9
    
    var body: some View {
            VStack {
                HeaderView(userName: viewModel.userName, userEmail: viewModel.userEmail)
                    .padding(.top, 30)
                
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
                
                HStack {
                    TextField("000-0000-0000", text: $phoneNumber)
                        .keyboardType(.numberPad)
                        .padding()
                        .onChange(of: phoneNumber) { newValue in
                            limitText(phoneNumberLimit)
                        }
                }
                .overlay(RoundedRectangle(cornerRadius: 1).stroke(lineWidth: 0.2).foregroundColor(Color.black))
                .padding([.trailing, .leading])
                .padding(.bottom)
                DropdownMenuForMomo(selectedNetwork: $viewModel.momoNetworkSelected, placeHolder: "Select Network", network: viewModel.momo) { network in
                    //
                    
                }
                .padding(.bottom)
                
                PrimaryButton(title: "Continue", width: 355, height: 55) {
                    isPresenting = true
                }
                Spacer()
                
            }
            .navigationDestination(
                 isPresented: $isPresenting) {
                      OTPView(viewModel: CardViewModel())
                      Text("")
                          .hidden()
                 }

        
    }
    
    func limitText(_ upper: Int)  {
           if phoneNumber.count > upper {
               phoneNumber = String(phoneNumber.prefix(upper))
           }
       }
}

struct MobilePaymentView_Previews: PreviewProvider {
    static var previews: some View {
        MobilePaymentView(viewModel: MomoViewModel())
    }
}
