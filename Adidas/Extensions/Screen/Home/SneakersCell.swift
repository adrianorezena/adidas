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
        ZStack(alignment: .top) {
            VStack {
                Spacer()
                    .frame(height: 80)
            
                HStack {
                    VStack(alignment: .leading) {
                        Text("Runfalcon")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text("sneakers")
                            .font(.callout)
                            .fontWeight(.regular)
                    }
                    
                    Spacer()
                    
                    Button(
                        action: {},
                        label: {
                            Image(systemName: "heart")
                                .foregroundColor(.black)
                                .padding(8)
                                .background(Color.white.opacity(0.5))
                                .clipShape(Circle())
                            
                        }
                    )
                }
                
                HStack {
                    Text("$ 276")
                        .font(.headline)
                        .fontWeight(.black)
                    
                    Spacer()
                    
                    Button(
                        action: {},
                        label: {
                            Image(systemName: "bag")
                                .foregroundColor(.gray)
                                .padding(8)
                                .background(Color.black)
                                .clipShape(Circle())
                            
                        }
                    )
                }
            }
            .padding(12)
            .background(
                gradient
            )
            .cornerRadius(20)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
                .shadow(radius: 3, x: -3, y: 6)
                .offset(y: -40)
        }
    }
}

struct SneakerCell_Previews: PreviewProvider {
    static var previews: some View {
        SneakersCell(
            imageName: "img_runfalcon_black",
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
