//
//  ContentView.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 29/01/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                
                Spacer()
                
                Color("Marine")
                    .ignoresSafeArea()
                
                VStack {
                    
                    Image("appLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.bottom, 40)
                    
                    SignInAndRegisterView()
                    
                }
                
            }.navigationBarHidden(true)
        }
    }
}

struct SignInAndRegisterView: View {
    
    @State var isSignInView: Bool = true
    
    var body: some View {
        
        VStack {
            HStack {
                
                Spacer()
                
                Button("SIGN IN") {
                    print("Sign in screen")
                    self.isSignInView = true
                }
                .foregroundColor(self.isSignInView ? .white : .gray)
                .font(.title3)
                
                Spacer()
                
                Button("REGISTER") {
                    print("Register screen")
                    self.isSignInView = false
                }
                .foregroundColor(!self.isSignInView ? .white : .gray)
                
                Spacer()
                
            }
            
            Spacer(minLength: 42)
            
            if isSignInView {
                
                SignInView()
                
            } else {
                
                RegisterView()
                
            }
            
        }
        
    }
}

struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var isHomeViewActive: Bool = false
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Text("Email*")
                    .foregroundColor(Color("Dark-Cian"))
                    .fontWeight(.bold)
                
                ZStack(alignment: .leading) {
                    
                    if email.isEmpty {
                        Text("example @gmail.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    TextField("", text: $email)
                        .foregroundColor(.white)
                    
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Text("Password")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                ZStack(alignment: .leading) {
                    
                    if password.isEmpty {
                        Text("*******")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $password)
                        .foregroundColor(.white)
                    
                }
                
                Divider()
                    .frame(height: 1)
                    .background(.gray)
                    .padding(.bottom)
                
                Text("Forget youre password?")
                    .font(.footnote)                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Button(action: signIn, label: {
                    Text("SIGN IN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6.0)
                                .stroke(Color("Dark-Cian"), lineWidth: 1.0)
                                .shadow(color: .white, radius: 6)
                            
                        )
                }).padding(.bottom, 60)
                
                
                
                Text("Sign in with social media")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 20)
                
                HStack {
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Facebook")
                            .foregroundColor(.white)
                            .font(.caption)
                            .frame(maxWidth: 125, alignment: .center)
                            .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15))
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color(red: 32/255, green: 49/255, blue: 82/255))
                            )
                    })
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Twitter")
                            .foregroundColor(.white)
                            .font(.caption)
                            .frame(maxWidth: 125, alignment: .center)
                            .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15))
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color(red: 32/255, green: 49/255, blue: 82/255))
                            )
                    })
                    
                    Spacer()
                    
                }
                
                
                
            }
            .padding(.horizontal, 77.0)
            
            NavigationLink(destination: Home(),
                           isActive: $isHomeViewActive,
                           label: {EmptyView()})
            
        }
    }
    
    func signIn() {
        print("I'm sign in...")
        self.isHomeViewActive = true
    }
    
}

struct RegisterView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPasswod: String = ""
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .center) {
                
                Text("Choose a profile picture")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("You can change o chosse later")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Button(action: takePhoto, label: {
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
                }).padding(.bottom)
                
            }
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    Text("Email*")
                        .foregroundColor(Color("Dark-Cian"))
                        .fontWeight(.bold)
                    
                    ZStack(alignment: .leading) {
                        
                        if email.isEmpty {
                            Text("example @gmail.com")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        TextField("", text: $email)
                            .foregroundColor(.white)
                        
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("Dark-Cian"))
                        .padding(.bottom)
                    
                }.frame(width: 300)
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    ZStack(alignment: .leading) {
                        
                        if password.isEmpty {
                            Text("*******")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        SecureField("", text: $password)
                            .foregroundColor(.white)
                        
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                        .padding(.bottom)
                }
                
                VStack(alignment: .leading) {
                    
                    Text("Confirm Password")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    ZStack(alignment: .leading) {
                        
                        if password.isEmpty {
                            Text("*******")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        SecureField("", text: $confirmPasswod)
                            .foregroundColor(.white)
                        
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                        .padding(.bottom)
                    
                }
                
                Button(action: register, label: {
                    Text("REGISTER")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6.0)
                                .stroke(Color("Dark-Cian"), lineWidth: 1.0)
                                .shadow(color: .white, radius: 6)
                            
                        )
                }).padding(.bottom, 30)
                
                
                
                Text("Register with social media")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 20)
                
                HStack {
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Facebook")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(maxWidth: 125, alignment: .center)
                            .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15))
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    })
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Twitter")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(maxWidth: 125, alignment: .center)
                            .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15))
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    })
                    
                    Spacer()
                    
                }
                
                
                
            }
            .padding(.horizontal, 77.0)
            
            
        }
    }
    
    func register() {
        
    }
    
    func takePhoto() {
        print("I'll take a profile picture")
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
