//
//  SizeCarousel.swift
//  Adidas
//
//  Created by Adriano Rezena on 23/02/23.
//

import SwiftUI

struct SizeCarousel: View {
    @State var selectedSizeIndex: Int = 0
    var availableSizes: [Double] = []
    var defaultHorizontalPadding: CGFloat = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(availableSizes.indices, id: \.self) { index in
                    Button(
                        action: {
                            selectedSizeIndex = index
                        },
                        label: {
                            let size: Double = availableSizes[index]
                            
                            if index == selectedSizeIndex {
                                Text(String(size))
                                    .padding(.horizontal, 20)
                                    .frame(height: 44)
                                    .overlay(
                                        Capsule()
                                            .stroke(lineWidth: 2)
                                            .padding(.vertical, 1)
                                    )
                            } else {
                                Text(String(size))
                                    .padding(.horizontal, 20)
                                    .frame(height: 44)
                                    .background(
                                        Capsule()
                                            .fill(.white.opacity(0.4))
                                    )
                            }
                        }
                    )
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .font(.callout)
                }
            }
            .padding(.horizontal, defaultHorizontalPadding)
        }
    }
}

struct SizeCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            
            SizeCarousel(availableSizes: [38.5, 40.5, 41.5, 42.5, 44.5])
        }
    }
}
