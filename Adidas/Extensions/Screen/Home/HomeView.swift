//
//  ContentView.swift
//  Adidas
//
//  Created by Adriano Rezena on 22/02/23.
//

import SwiftUI

struct HomeView: View {
    @State var searchText: String = ""
    @State var headerTopPadding: CGFloat = 0
    
    let categories: [String] = [
        "All",
        "Running",
        "Originals",
        "Soccer"
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            GeometryReader { reader in
                VStack(spacing: 16) {
                    headerView
                    
                    categoriesCarouselView
                    
                    sneakersCarouselView
                    
                    Spacer()
                }
                .edgesIgnoringSafeArea(.top)
                .onAppear {
                    headerTopPadding = reader.safeAreaInsets.top
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
        .padding(.top, headerTopPadding)
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
                ForEach(categories, id: \.self) {
                    Text($0)
                        .padding(.horizontal, 30)
                        .frame(height: 50)
                        .background(Color.white.opacity(0.12))
                        .cornerRadius(25)
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
                    Color(uiColor: #colorLiteral(red: 0.9066745639, green: 0.832691133, blue: 0.3331795335, alpha: 1)),
                    Color(uiColor: #colorLiteral(red: 0.9723359942, green: 0.7149500847, blue: 0.2595788538, alpha: 1))
                ],
                startPoint: UnitPoint(x: 0, y: 0),
                endPoint: UnitPoint(x: 1, y: 1)),
            LinearGradient(
                colors: [
                    Color(uiColor: #colorLiteral(red: 0.78745538, green: 0.9136320949, blue: 0.9885738492, alpha: 1)),
                    Color(uiColor: #colorLiteral(red: 0.804859221, green: 0.7956503034, blue: 1, alpha: 1))
                ],
                startPoint: UnitPoint(x: 0, y: 0),
                endPoint: UnitPoint(x: 1, y: 1)),
            LinearGradient(
                colors: [
                    Color(uiColor: #colorLiteral(red: 0.9123154283, green: 0.2850663662, blue: 0.2293762565, alpha: 1)),
                    Color(uiColor: #colorLiteral(red: 0.9563469291, green: 0.5144945979, blue: 0.2033494711, alpha: 1))
                    
                ],
                startPoint: UnitPoint(x: 0, y: 0),
                endPoint: UnitPoint(x: 1, y: 1))
        ]
    }
    
    var sneakersCarouselView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                SneakersCell(
                    imageName: Images.sneakerBlack.rawValue,
                    gradient: gradients[0]
                )
                
                SneakersCell(
                    imageName: Images.sneakerWhite.rawValue,
                    gradient: gradients[1]
                )
                
                SneakersCell(
                    imageName: Images.sneakerGray.rawValue,
                    gradient: gradients[2]
                )
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 250)
        .offset(y: 10)
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
