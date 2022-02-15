//
//  EditProfileView.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 15/02/22.
//

import SwiftUI

struct EditProfileView: View {
    
    @State var profileImage: Image? = Image("profileExample")
    @State var isCameraActive: Bool = false
    
    
    var body: some View {
        
        ZStack {
            
            Color("Marine")
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack {
                    
                    Text("EDIT PROFILE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity)
                        .padding()
                    
                    Button(action: { self.isCameraActive = true }, label: {
                        ZStack {
                            profileImage!
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118, height: 118)
                                .cornerRadius(59)
                                .sheet(isPresented: $isCameraActive,
                                       content: {
                                    SUImagePickerView(sourceType: .photoLibrary, image: self.$profileImage, isPresented: $isCameraActive)
                                })
                            
                            Image(systemName: "camera")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 25, height: 25)
                            
                        }
                    })
                    
                    
                }.padding(.bottom, 18)
                
                EditModule()
                
                
                
            }
            
        }
        .onAppear(perform: {
            if let UiImage = getUiImage(named: "profile_foto.png") {
                self.profileImage = Image(uiImage: UiImage)
            } else{
                print("Profile image not found in device")
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

struct EditModule: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var userName: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            VStack {
             
                Text("Email")
                    .foregroundColor(Color("Dark-Cian"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack(alignment: .leading) {
                    
                    if email.isEmpty {
                        Text(verbatim: "example@gmail.com")
                            .font(.caption)
                            .foregroundColor(Color("InputPlaceholder"))
                    }
                    
                    TextField("", text: $email)
                        .foregroundColor(.white)
                    
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                
            }.padding(.bottom, 10)
            
            VStack {
             
                Text("Password")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack(alignment: .leading) {
                    
                    if password.isEmpty {
                        Text("*********")
                            .font(.caption)
                            .foregroundColor(Color("InputPlaceholder"))
                    }
                    
                    SecureField("", text: $password)
                        .foregroundColor(.white)
                    
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("InputPlaceholder"))
                
            }.padding(.bottom, 10)
            
            VStack {
             
                Text("Username")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack(alignment: .leading) {
                    
                    if email.isEmpty {
                        Text(verbatim: "example99")
                            .font(.caption)
                            .foregroundColor(Color("InputPlaceholder"))
                    }
                    
                    TextField("", text: $userName)
                        .foregroundColor(.white)
                    
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("InputPlaceholder"))
                
            }.padding(.bottom, 32)
            
            Button(action: updateUserInformation, label: {
                
                Text("UPDATE")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color("Dark-Cian"), lineWidth: 1)
                            .shadow(color: .white, radius: 6)
                    )
                
            }).padding(.bottom)
            
            
        }.padding(.horizontal, 42)
        
        
        
        
    }
    
    func updateUserInformation() {
        let saveData = SaveData()
        
        let result = saveData.saveUserInformation(email: self.email, password: self.password, userName: self.userName)
        
        print("Information updated successfully? \(result ? "yes": "false").")
        
    }
    
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
