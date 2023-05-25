//
//  OtherPaymentChannelsView.swift
//  SeerBit-SDK
//
//  Created by Princess on 13/03/2023.
//

import SwiftUI

struct OtherPaymentChannelsView: View {
    @ObservedObject var viewModel: CardViewModel
    @State var isPresentingBankAccountView = false
    @State var isPresentingTransferView = false
    @State var isPresentingUSSDView = false
    @State var isPresentingCardView = false
    @State var isPresentingPhoneNumber = false
    
    var body: some View {
            VStack {
                HeaderView(userName: "Tola Sambo", userEmail: "omotola.sambo@seerbit.om")
                    .padding([.top, .bottom], 30)
                

                
                VStack {
                    HStack {
                        Text("Other Payment Channels")
                            .padding([.top, .leading])
                        Spacer()
                    }
                    CustomButtonGray2(title: "Debit/Credit Card", width: 350, height: 55) {
                        //
                    }
                    
                    CustomButtonGray2(title: "Bank Account", width: 350, height: 55) {
                        isPresentingBankAccountView = true
                    }
                    CustomButtonGray2(title: "Transfer", width: 350, height: 55) {
                        isPresentingTransferView = true
                        //viewModel.
                    }
                    CustomButtonGray2(title: "USSD                                       *bank USSD code", width: 350, height: 55) {
                        isPresentingUSSDView = true
                    }
                    CustomButtonGray2(title: "Phone Number", width: 350, height: 55) {
                        isPresentingPhoneNumber = true
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
               Spacer()
            }
            .onAppear{
                viewModel.isPresenting = false
            }
            
            .navigationDestination(
                isPresented: $isPresentingBankAccountView) {
                    BankHomeView(viewModel: BankViewModel())
                    Text("")
                        .hidden()
                }
                .navigationDestination(
                    isPresented: $isPresentingPhoneNumber) {
                        MobilePaymentView(viewModel: MomoViewModel())
                        Text("")
                            .hidden()
                    }
                .navigationDestination(
                    isPresented: $isPresentingTransferView) {
                        TransferView(viewModel: TransferViewModel())
                        Text("")
                            .hidden()
                    }
                    .navigationDestination(
                        isPresented: $isPresentingUSSDView) {
                            BankCodeView(viewModel: BankViewModel())
                            Text("")
                                .hidden()
                        }

                        .navigationDestination(
                            isPresented: $isPresentingCardView) {
                                BankHomeView(viewModel: BankViewModel())
                                Text("")
                                    .hidden()
                            }
                           
   
        //.navigationBarBackButtonHidden(true)
    }
}

struct OtherPaymentChannelsView_Previews: PreviewProvider {
    static var previews: some View {
        OtherPaymentChannelsView(viewModel: CardViewModel())
    }
}
