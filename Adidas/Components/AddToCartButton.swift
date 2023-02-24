//
//  AddToCartButton.swift
//  Adidas
//
//  Created by Adriano Rezena on 23/02/23.
//

import SwiftUI

struct AddToCartButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(
            action: action,
            label: {
                HStack {
                    Text("Add to cart")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(.homeBuy)
                        .frame(width: 52, height: 52)
                        .background(Color.gradient1Color1)
                        .clipShape(Circle())
                        .foregroundColor(.black)
                }
                .padding(.leading, 30)
                .padding(.trailing, 6)
                .frame(height: 64)
                .background(.black)
                .cornerRadius(32)
            }
                
        )
    }
}

struct AddToCartButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButton(action: {})
    }
}
