//
//  DropdownMenuList.swift
//  SeerBit-SDK
//
//  Created by Princess on 16/03/2023.
//

import SwiftUI

struct DropdownMenuList: View {
    let banks: [AllBanksModel]
    let onSelectedAction: ( _ bank: AllBanksModel) -> Void
    
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
        DropdownMenuList(banks: AllBanksModel.example, onSelectedAction: { _ in})
    }
}
