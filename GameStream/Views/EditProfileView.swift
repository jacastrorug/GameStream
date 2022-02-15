//
//  EditProfileView.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 15/02/22.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        
        ZStack {
            
            Color("Marine")
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack {
                    
                    Button(action: {}, label: {
                        ZStack {
                            Image("profileExample")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .cornerRadius(40)
                            
                            Image(systemName: "camera")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 25.0, height: 25.0)
                            
                        }
                    })
                    
                    
                }.padding(.bottom, 18)
                
                
                
            }
            
        }
        
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
