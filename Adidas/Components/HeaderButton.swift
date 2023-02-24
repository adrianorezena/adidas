//
//  HeaderButton.swift
//  Adidas
//
//  Created by Adriano Rezena on 23/02/23.
//

import SwiftUI

struct HeaderButton: View {
    let image: Images
    let action: () -> Void
    
    var body: some View {
        Button(
            action: action,
            label: {
                Image(image)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .frame(height: 55)
                    .padding(.horizontal, 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.black, lineWidth: 2)
                    )
            }
        )
    }
}

struct HeaderButton_Previews: PreviewProvider {
    static var previews: some View {
        HeaderButton(image: .homeBuy, action: {})
    }
}
