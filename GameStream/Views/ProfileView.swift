//
//  ProfileView.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 15/02/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var userName: String = "Lorem"
    
    @State var profileImage: UIImage = UIImage(named: "imageComments")!
    
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
                    
                    Image(uiImage: profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(40)
                    
                    Text("\(self.userName)")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
                SettingsModule()
                
                Spacer()
                
                
            }
            
            
            
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            
            print("Searching for user info in my user defaults")
            
            
            if let UiImage = getUiImage(named: "profile_foto.png") {
                self.profileImage = UiImage
            } else{
                print("Profile image not found in device")
            }
            
            
            let saveData = SaveData()
            let result = saveData.getUserInformation()
            
            if result.count > 0 {
                self.userName = result[2]
            }
            
        })
        
    }

    func getUiImage(named: String) -> UIImage? {
        
        if let dir = try? FileManager.default.url(for: .documentDirectory,
                                                in: .userDomainMask,
                                                appropriateFor: nil,
                                                     create: false) {
            
            let url = URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path
            return UIImage(contentsOfFile: url)
            
        }
        
        return nil
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
