//
//  ColorsCarousel.swift
//  Adidas
//
//  Created by Adriano Rezena on 23/02/23.
//

import SwiftUI

struct ColorsCarousel: View {
    @State var availableColors: [Color] = []
    @State var selectedColorIndex: Int = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(availableColors.indices, id: \.self) { index in
                    let color: Color = availableColors[index]
                    
                    Button(
                        action: {
                            selectedColorIndex = index
                        },
                        label: {
                            Circle()
                                .fill(color)
                                .frame(height: 16)
                                .background {
                                    Circle()
                                        .stroke(lineWidth: selectedColorIndex == index ? 12 : 0)
                                        .foregroundColor(.white.opacity(0.7))
                                }
                        }
                    )
                }
            }
            .padding(.horizontal, 8)
            .fixedSize(horizontal: true, vertical: false)
        }
        .frame(height: 32)
    }
}

struct ColorsCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            
            ColorsCarousel(
                availableColors: [.black, .blue, .white]
            )
        }
    }
}
