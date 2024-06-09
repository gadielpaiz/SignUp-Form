//
//  Constants.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/1/24.
//

import SwiftUI

final class Constants {
    static let shared = Constants()
    private init() {}
}

extension Constants {
    var scrnPercForTitle: (GeometryProxy) -> CGFloat {
        { geometry in
            geometry.size.width * 0.7
        }
    }
    
    var scrnPercForSheet: (GeometryProxy) -> CGFloat {
        { geometry in
            geometry.size.height * 0.90
        }
    }

    
    static let mainHorizontalPadding: CGFloat = 30
    static let sheetCornerRadius: CGFloat = 30
    static let paddingBetweenSections: CGFloat = 40
    static let paddingForCloseButton = EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 10)
    
}
