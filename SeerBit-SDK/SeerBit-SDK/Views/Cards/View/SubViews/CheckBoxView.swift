//
//  CheckBoxView.swift
//  SeerBit-SDK
//
//  Created by Princess on 15/03/2023.
//

import SwiftUI
import UIKit

struct CheckBoxView: View {
    @Binding var checked: Bool
    @Binding var checkColor: Color
    @Binding var unCheckColor: Color

       var body: some View {
           Image(uiImage: checked ?  ImageProvider.image(named: "checkmark") ?? UIImage() : ImageProvider.image(named: "rectangleCheck") ?? UIImage())
               .resizable()
               .renderingMode(.template)
               .foregroundColor(checked ? Color(UIColor.systemGreen) : Color.gray)
               .onTapGesture {
                   self.checked.toggle()
               }
       }
}

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false
        @State var checkColor: Color = Color(UIColor.systemBlue)
        @State var unCheckColor: Color = Color.secondary
        var body: some View {
            CheckBoxView(checked: $checked,
                         checkColor: $checkColor,
                         unCheckColor: $unCheckColor)
        }
    }
    
    static var previews: some View {
        CheckBoxViewHolder()
    }
}
