//
//  DropdownMenu.swift
//  SeerBit-SDK
//
//  Created by Princess on 16/03/2023.
//

import SwiftUI

struct DropdownMenu: View {
    @State private var isBankListPresented: Bool = false
    @Binding var selectedBank: MerchantBank?
    let placeHolder: String
    let banks: [MerchantBank]
    let onSelectedAction: ( _ bank: MerchantBank) -> Void
    
    
    
    var body: some View {
        VStack {
            Button(action: {
                self.isBankListPresented.toggle()
            }) {
                HStack {
                    Text((selectedBank == nil ? placeHolder : selectedBank?.bankName) ?? "")
                        .fontWeight(.medium)
                        .foregroundColor(selectedBank == nil ? .gray : .black)
                    
                    Spacer()
                    Image(systemName: self.isBankListPresented ? "chevron.up" : "chevron.down")
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray, lineWidth: 1)
            }
            .overlay(alignment: .top) {
                VStack {
                    if self.isBankListPresented {
                        Spacer(minLength: 60)
                        DropdownMenuList(banks: self.banks) { bank in
                            self.isBankListPresented = false
                            self.selectedBank = bank
                        }
                    }
                }
            }
            .padding([.leading, .trailing])
            .padding(
                .bottom, self.isBankListPresented ?
                CGFloat(self.banks.count * 45) > 300 ? 300 :
                    CGFloat(self.banks.count * 45) :
                    0
            )
        }
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu(selectedBank: .constant(nil), placeHolder: "Select Bank", banks: [], onSelectedAction: { _ in})
    }
}


struct DropdownMenuForMomo: View {
    @State private var isNetworkListSelected: Bool = false
    @Binding var selectedNetwork: MomoNetworks?
    let placeHolder: String
    let network: [MomoNetworks]
    let onSelectedAction: ( _ network: MomoNetworks) -> Void
   
    
    
    
    var body: some View {
        VStack {
            Button(action: {
                self.isNetworkListSelected.toggle()
            }) {
                HStack {
                    Text((selectedNetwork == nil ? placeHolder : selectedNetwork?.networks) ?? "")
                        .fontWeight(.medium)
                        .foregroundColor(selectedNetwork == nil ? .gray : .black)
                    
                    Spacer()
                    Image(systemName: self.isNetworkListSelected ? "chevron.up" : "chevron.down")
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray, lineWidth: 1)
            }
            .overlay(alignment: .top) {
                VStack {
                    if self.isNetworkListSelected {
                        Spacer(minLength: 60)
                        DropdownMenuListForMomoNetworks(networks: self.network) { network in
                            self.isNetworkListSelected = false
                            self.selectedNetwork = network
                        }
                    }
                }
            }
            .padding([.leading, .trailing])
            .padding(
                .bottom, self.isNetworkListSelected ?
                CGFloat(self.network.count * 45) > 300 ? 300 :
                    CGFloat(self.network.count * 45) :
                    0
            )
        }
    }
}

struct DropdownMenuForMomo_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuForMomo(selectedNetwork: .constant(nil), placeHolder: "Select Network", network: MomoNetworks.example, onSelectedAction: { _ in})
    }
}
