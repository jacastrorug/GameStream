//
//  ProfileView.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 15/02/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var userName: String = "Lorem"
    
    var body: some View {
        
        ZStack {
            
            Color("Marine")
                .ignoresSafeArea()
            
            VStack {
                
                Text("PROFILE")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity)
                    .padding()
                
                VStack {
                    
                    Image("imageComments")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(40)
                    
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
                SettingsModule()
                
                
            }
            
            
            
        }.onAppear(perform: {
            
            print("Searching for user info in my user defaults")
            
        }).navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}

struct SettingsModule: View {
    
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    
    var body: some View {
        VStack {
            
            Text("SETTINGS")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 18)
            
            VStack(spacing: 3) {
             
                Button(action: {}, label: {
                    
                    HStack {
                     
                        Text("Account")
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                        
                    }.padding()
                    .background(Color("Blue-Gray"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 8)
                        
                })
                
                Button(action: {}, label: {
                    
                    HStack {
                     
                        Text("Notifications")
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Toggle("", isOn: $isToggleOn)
                        
                    }.padding()
                    .background(Color("Blue-Gray"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 8)
                        
                })
                
                Button(action: { self.isEditProfileViewActive = true }, label: {
                    
                    HStack {
                     
                        Text("Edit Profile")
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                        
                    }.padding()
                    .background(Color("Blue-Gray"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 8)
                        
                })
                
                Button(action: {}, label: {
                    
                    HStack {
                     
                        Text("Rate app")
                            .foregroundColor(.white)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                        
                    }.padding()
                    .background(Color("Blue-Gray"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 8)
                        
                })
                
            }
            
            NavigationLink(destination: EditProfileView(),
                           isActive: $isEditProfileViewActive,
                           label: {EmptyView()})
            
            
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
