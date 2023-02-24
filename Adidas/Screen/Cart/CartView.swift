//
//  CartView.swift
//  Adidas
//
//  Created by Adriano Rezena on 23/02/23.
//

import SwiftUI

struct CartView: View {
    let defaultHorizontalPadding: CGFloat = 30
    let product: Product
    var onCloseButton: (() -> Void)?
    
    var body: some View {
        ZStack {
            backgroundGradientView
            
            VStack(spacing: 30) {
                headerButtons
                
                productView
                
                priceAndColorsView
                
                SizeCarousel(availableSizes: [38.5, 40.5, 41.5, 42.5, 44.5], defaultHorizontalPadding: defaultHorizontalPadding)
                
                AddToCartButton(action: {})
                    .padding(.horizontal, defaultHorizontalPadding)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // MARK: - Header
    var headerButtons: some View {
        HStack {
            HeaderButton(
                image: .backArrow,
                action: {
                    onCloseButton?()
                }
            )
            
            Spacer()
            
            HeaderButton(image: .homeLiked, action: {})
        }
        .padding(.horizontal, defaultHorizontalPadding)
    }
    
    // MARK: - Product
    var productView: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: -8) {
                Text(product.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(product.category)
                    .font(.title)
                    .fontWeight(.regular)
            }
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .shadow(radius: 10, x: -5, y: 18)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, defaultHorizontalPadding)
    }
    
    // MARK: - Price & Colors
    var priceAndColorsView: some View {
        HStack {
            priceView
            
            Spacer()
            
            colorsView
        }
        .frame(height: 50)
        .padding(.leading, defaultHorizontalPadding)
    }
    
    // MARK: - Price
    var priceView: some View {
        VStack(alignment: .leading) {
            Text("Price:")
            
            Spacer()
            
            Text(product.price)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
    
    // MARK: - Colors
    var colorsView: some View {
        VStack(alignment: .leading) {
            Text("COLORS:")
            
            ColorsCarousel(
                availableColors: [
                    .black,
                    .cyan,
                    .gray,
                    .yellow,
                    .blue,
                    .green,
                    .orange,
                    .pink,
                    .red
                ]
            )
            .frame(maxWidth: 150, alignment: .trailing)
        }
    }
    
    // MARK: - Background
    var backgroundGradientView: some View {
        LinearGradient(
            colors: [
                .gradient1Color1,
                .gradient1Color2
            ],
            startPoint: UnitPoint(x: 0, y: 0),
            endPoint: UnitPoint(x: 1, y: 1))
        .edgesIgnoringSafeArea(.all)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(
            product: Product(
                image: Images.sneakerBlack,
                name: "Runfalcon",
                category: "sneakers",
                price: "$ 276"
            )
        )
    }
}
