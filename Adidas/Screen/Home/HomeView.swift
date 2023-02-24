//
//  ContentView.swift
//  Adidas
//
//  Created by Adriano Rezena on 22/02/23.
//

import SwiftUI

struct HomeView: View {
    @State var path: [Product] = []
    @State var searchText: String = ""
    @State var selectedCategoryIndex: Int = 0
    
    let categories: [String] = [
        "All",
        "Running",
        "Originals",
        "Soccer"
    ]
    
    var products: [Product] = [
        Product(
            image: Images.sneakerBlack,
            name: "Runfalcon",
            category: "sneakers",
            price: "$ 276"
        ),
        Product(
            image: Images.sneakerWhite,
            name: "Runfalcon",
            category: "sneakers",
            price: "$ 249"
        ),
        Product(
            image: Images.sneakerGray,
            name: "Runfalcon",
            category: "sneakers",
            price: "$ 269"
        )
    ]

    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                GeometryReader { reader in
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 16) {
                            headerView
                            
                            categoriesCarouselView
                            
                            sneakersCarouselView
                            
                            sportswearView
                        }
                        .edgesIgnoringSafeArea(.top)
                    }
                }
            }
        }
    }
}

// MARK: - Header
extension HomeView {
    
    var headerView: some View {
        VStack(spacing: 20) {
            headerMenuProfile

            headerWelcomeText
            
            headerSearchBar
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.homeHeader.edgesIgnoringSafeArea(.top))
        .cornerRadius(32, corners: [.bottomLeft, .bottomRight])
        .padding(.horizontal, 16)
    }
    
    var headerMenuProfile: some View {
        HStack {
            Button(action: {}, label: {
                Image(.homeMenu)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundColor(.black)
                    .frame(width: 35, height: 35)
            })
            .frame(width: 44, height: 44)

            Spacer()

            Image(.homeLogo)
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)

            Spacer()

            Image(.homeProfile)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(lineWidth: 1)
                )
                .frame(width: 48, height: 48)
        }
        .frame(height: 44)
        .frame(maxWidth: .infinity)
        
    }
    
    var headerWelcomeText: some View {
        VStack(alignment: .leading) {
            Text("Welcome")
                .font(.title)
            
            Text("All united we are our best version")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var headerSearchBar: some View {
        TextField("Search...", text: $searchText)
            .padding(16)
            .background(Color.homeSearchBackground)
            .cornerRadius(24)
    }
}

// MARK: - Categories
extension HomeView {

    var categoriesCarouselView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(categories.indices, id: \.self) { index in
                    let categoryName: String = categories[index]
                    
                    Button(
                        action: {
                            selectedCategoryIndex = index
                        },
                        label: {
                            if index == selectedCategoryIndex {
                                Text(categoryName)
                                    .padding(.horizontal, 30)
                                    .frame(height: 50)
                                    .overlay(
                                        Capsule()
                                            .stroke()
                                            .padding(.vertical, 1)
                                    )
                            } else {
                                Text(categoryName)
                                    .padding(.horizontal, 30)
                                    .frame(height: 50)
                                    .background(Color.white.opacity(0.12))
                                    .cornerRadius(25)
                            }
                        }
                    )
                    
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal, 16)
        }
    }
}

// MARK: - Sneakers
extension HomeView {
    
    var gradients: [LinearGradient] {
        [
            LinearGradient(
                colors: [
                    .gradient1Color1,
                    .gradient1Color2
                ],
                startPoint: UnitPoint(x: 0, y: 0),
                endPoint: UnitPoint(x: 1, y: 1)),
            LinearGradient(
                colors: [
                    .gradient2Color1,
                    .gradient2Color2
                ],
                startPoint: UnitPoint(x: 0, y: 0),
                endPoint: UnitPoint(x: 1, y: 1)),
            LinearGradient(
                colors: [
                    .gradient3Color1,
                    .gradient3Color2
                ],
                startPoint: UnitPoint(x: 0, y: 0),
                endPoint: UnitPoint(x: 1, y: 1))
        ]
    }
    
    var sneakersCarouselView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            let _ = print(products.count)
            
            LazyHStack {
                ForEach(products.indices, id: \.self) { index in
                    let product: Product = products[index]
                    
                    NavigationLink(value: product) {
                        SneakersCell(
                            product: product,
                            gradient: gradients[index % 3]
                        )
                    }
                    .navigationDestination(for: Product.self) { product in
                        CartView(product: product, onCloseButton: { path = [] })
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 250)
        .offset(y: 10)
    }
}

// MARK: - Sportwear
extension HomeView {
    
    var sportswearView: some View {
        VStack {
            HStack {
                Text("Sportwear")
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(
                    action: {},
                    label: {
                        Text("View all")
                            .foregroundColor(.gradient1Color2)
                    }
                )
            }
            .padding(.horizontal, 16)
            
            Image(.homeSportswear)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
        }
    }
    
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
        HomeView()
            .previewDevice(PreviewDevice(stringLiteral: "iPhone SE (2nd generation)"))
    }
}
