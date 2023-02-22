//
//  View+Extensions.swift
//  Adidas
//
//  Created by Adriano Rezena on 22/02/23.
//

import SwiftUI

public enum Images: String {
    case homeMenu = "line.3.horizontal"
    case homeLogo = "img_adidas_logo"
    case homeProfile = "img_profile"

    enum `Type` {
        case asset
        case symbol
    }
    
    var type: Type {
        switch self {
        case .homeMenu:
            return .symbol
        default:
            return .asset
        }
    }
}

extension Image {
    public init(_ image: Images) {
        switch image.type {
        case .symbol:
            self.init(systemName: image.rawValue)
        case .asset:
            self.init(image.rawValue)
        }
    }
}
