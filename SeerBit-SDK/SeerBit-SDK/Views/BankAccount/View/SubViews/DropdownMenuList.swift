//
//  DropdownMenuList.swift
//  SeerBit-SDK
//
//  Created by Princess on 16/03/2023.
//

import SwiftUI

struct DropdownMenuList: View {
    let banks: [MerchantBank]
    let onSelectedAction: ( _ bank: MerchantBank) -> Void
    
    var body: some View {
        
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 2) {
                ForEach(banks) { bank in
                    
                    Button(action: {
                        self.onSelectedAction(bank)
                    }) {
                        Text(bank.bankName)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                }
            }   
        }
        .frame(height: CGFloat(self.banks.count * 45) > 300
            ? 300
               : CGFloat(self.banks.count * 45)
        )
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gray, lineWidth: 1)
        }
    }
}

struct DropdownMenuList_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuList(banks: [], onSelectedAction: { _ in})
    }
}


struct DropdownMenuListForMomoNetworks: View {
    let networks: [MomoNetworks]
    let onSelectedAction: ( _ network: MomoNetworks) -> Void
    
    var body: some View {
        
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 2) {
                ForEach(networks) { network in
                    
                    Button(action: {
                        self.onSelectedAction(network)
                    }) {
                        Text(network.networks)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                }
            }
        }
        .frame(height: CGFloat(self.networks.count * 45) > 300
            ? 300
               : CGFloat(self.networks.count * 45)
        )
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gray, lineWidth: 1)
        }
    }
}

struct DropdownMenuListForMomoNetworks_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuListForMomoNetworks(networks: MomoNetworks.example, onSelectedAction: { _ in})
    }
}
