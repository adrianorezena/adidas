//
//  ContentView.swift
//  Adidas
//
//  Created by Adriano Rezena on 22/02/23.
//

import SwiftUI

struct HomeView: View {
    @State var searchText: String = ""
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                headerView
                    .edgesIgnoringSafeArea(.top)
                
                Spacer()
            }
        }
    }
}

// MARK: - Header
extension HomeView {
    
    var headerView: some View {
        VStack {
            Spacer()
            
            headerMenuProfile
            
            Spacer()
            
            headerWelcomeText

            Spacer()
            
            headerSearchBar
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .frame(height: 305)
        .background(Color.homeHeader)
        .cornerRadius(32, corners: [.bottomLeft, .bottomRight])
        .padding(.horizontal, 16)
    }
    
    var headerMenuProfile: some View {
        HStack {
            Button(action: {}, label: {
                // Image(systemName: "line.3.horizontal")
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

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
