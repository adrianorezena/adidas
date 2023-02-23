//
//  SneakerCell.swift
//  Adidas
//
//  Created by Adriano Rezena on 22/02/23.
//

import SwiftUI

struct SneakersCell: View {
    let imageName: String
    let gradient: LinearGradient
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 80)
                .overlay(
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 130)
                        .shadow(radius: 3, x: -3, y: 6)
                        .offset(y: -30)
                )
            
            nameView
            
            priceView
        }
        .padding(12)
        .background(
            gradient
                .clipShape(RoundedRectangle(cornerRadius: 20))
        )
        .frame(maxWidth: 160)
    }
    
    var nameView: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: -4) {
                Text("Runfalcon")
                    .font(.headline)
                    .fontWeight(.black)
                
                Text("sneakers")
                    .font(.callout)
                    .fontWeight(.regular)
            }
            
            Spacer()
            
            likeButton
        }
    }
    
    var priceView: some View {
        HStack(spacing: 0) {
            Text("$ 276")
                .font(.headline)
                .fontWeight(.black)
            
            Spacer()
            
            buyButton
        }
    }
    
    var likeButton: some View {
        Button(
            action: {},
            label: {
                Image(.homeLike)
                    .font(.footnote)
                    .foregroundColor(.black)
                    .padding(8)
                    .background(Color.white.opacity(0.5))
                    .clipShape(Circle())
                
            }
        )
    }
    
    var buyButton: some View {
        Button(
            action: {},
            label: {
                Image(.homeBuy)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(8)
                    .background(Color.black)
                    .clipShape(Circle())
            }
        )
    }
    
}

struct SneakerCell_Previews: PreviewProvider {
    static var previews: some View {
        SneakersCell(
            imageName: Images.sneakerBlack.rawValue,
            gradient: LinearGradient(
                colors: [
                    Color(uiColor: #colorLiteral(red: 0.9066745639, green: 0.832691133, blue: 0.3331795335, alpha: 1)),
                    Color(uiColor: #colorLiteral(red: 0.9723359942, green: 0.7149500847, blue: 0.2595788538, alpha: 1))
                ],
                startPoint: UnitPoint(x: 0, y: 0),
                endPoint: UnitPoint(x: 1, y: 1))
        )
    }
        
}
