//
//  PointSystem.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 17/02/22.
//

import SwiftUI

struct PointSystem: View {
    var body: some View {
        Rectangle()
            .frame(width: 100, height: 100)
            .foregroundColor(.blue)
    }
}

struct PointSystem_Previews: PreviewProvider {
    static var previews: some View {
        PointSystem()
        
        PointSystem()
            .previewDevice("iPhone 11")
        
    }
}
