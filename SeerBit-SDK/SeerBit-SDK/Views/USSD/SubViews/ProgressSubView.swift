//
//  ProgressSubView.swift
//  SeerBit-SDK
//
//  Created by Princess on 22/03/2023.
//

import SwiftUI

struct RoundedRectProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 14)
                .frame(width: 340, height: 18)
                .foregroundColor(.blue)
                .overlay(Color.black.opacity(0.5)).cornerRadius(14)
            
            RoundedRectangle(cornerRadius: 14)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 340, height: 18)
                .foregroundColor(.yellow)
        }
        .padding()
    }
}


struct LoadingProgressBar: View {
    private let maxOffset = 1 / 0.4 * abs(-1)
    @State private var offset: CGFloat = -1
    
    var body: some View {
        Rectangle()
            .foregroundColor(.gray.opacity(0.4))
            .frame(height: 5)
            .cornerRadius(7)
            .overlay(GeometryReader { geo in
                overlayRect(in: geo.frame(in: .local))
            })
    }
    
    private func overlayRect(in rect: CGRect) -> some View {
        let width = rect.width * 0.4
        return Rectangle()
            .cornerRadius(7)
            .foregroundColor(.gray)
            .frame(width: width)
            .offset(x: width * offset)
            .onAppear {
                withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                    self.offset = maxOffset;
                }
            }
    }
}
