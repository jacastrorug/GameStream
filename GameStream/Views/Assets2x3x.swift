//
//  Assets2x3x.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 17/02/22.
//

import SwiftUI

struct Assets2x3x: View {
    var body: some View {
        
        Image("platzi")
        
    }
}

struct Assets2x3x_Previews: PreviewProvider {
    static var previews: some View {
        Assets2x3x()
        Assets2x3x()
            .previewDevice("iPhone 8")
        Assets2x3x()
            .previewDevice("iPhone 13 Pro Max")
    }
}
