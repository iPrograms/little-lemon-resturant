//
//  Profile.swift
//  OnBoardingRegistration
//  UserProfile View
//  Created by Manzoor Ahmed on 7/23/24.
//
import SwiftUI

// Custom checkbox
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // Return a view that has checklist appearance and behavior.
        Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
            .onTapGesture {
                configuration.isOn.toggle()
            }
        configuration.label
    }
}

struct UserProfile: View {
    @EnvironmentObject var defaultSettings: DefaultStatesData
    @Environment(\.presentationMode) var presentation
    @State var isLoggedOut: Bool = false
    @State var goBackHome: Bool = false
    
    // Let's use EnviromentObject instead of :
    // let userFirstName: String? = UserDefaults.standard.string(forKey: kFirstName)
    // let userLastName: String? = UserDefaults.standard.string(forKey: kLastName)
    // let userEmail: String? = UserDefaults.standard.string(forKey: kemail)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Header()
                    Divider()
                    // Profile image
                    VStack {
                        HStack {
                            Text("Personal Information").font(Font.custom("Karla-Medium", size: 20)).bold()
                                .padding()
                                .foregroundColor(Color.greenForGroundColor)
                            Spacer()
                        }
                        HStack {
                            Text("\(defaultSettings.name)")
                                .font(Font.custom("Karla-Light", size: 12))
                            
                        }.frame(width: 320, height: 16, alignment: .leading)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Image("Profile")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 140/2, height: 171/2)
                                    .padding(.trailing, 15)
                            }
                            Button(action: {}, label: {
                                Text("Change")
                                    .frame(width: 100, height: 50)
                                    .background(Color.greenForGroundColor)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .cornerRadius(8)
                                
                            }).padding(.trailing, 12)
                            Button(action: {}, label: {
                                Text("Remove")
                                    .frame(width: 100, height: 50)
                                    .border(Color.greenForGroundColor)
                                    .font(.headline)
                                    .foregroundColor(Color.greenForGroundColor)
                            })
                        }
                    }
                    .padding(.horizontal, 10.0)
                    .padding(.bottom, 12)
                    
                    // First name
                    VStack(alignment: .leading, spacing: 12) {
                        Text("First name")
                            .font(Font.custom("Karla-Medium", size: 16)).bold()
                            .foregroundColor(Color.greenForGroundColor)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 8.0)
                                .stroke(lineWidth: 0.9)
                                .foregroundColor(.gray)
                                .frame(width: 350, height: 50)
                            
                            TextField("\(defaultSettings.name)", text: $defaultSettings.name)
                                .frame(width: 320, height: 50)
                                .padding(.horizontal, 16)
                                .font(Font.custom("Karla-Medium", size: 18))
                                .foregroundColor(Color.greenForGroundColor)
                        }
                        
                        // Last name
                        Text("Last name")
                            .font(Font.custom("Karla-Medium", size: 16)).bold()
                            .foregroundColor(Color.greenForGroundColor)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 8.0)
                                .stroke(lineWidth: 0.9)
                                .foregroundColor(.gray)
                                .frame(width: 350, height: 50)
                            
                            TextField("\(defaultSettings.lastName)", text: $defaultSettings.lastName)
                                .frame(width: 320, height: 50)
                                .padding(.horizontal, 16)
                                .font(Font.custom("Karla-Medium", size: 18))
                                .foregroundColor(Color.greenForGroundColor)
                        }
                        
                        // Email
                        Text("Email")
                            .font(Font.custom("Karla-Medium", size: 16)).bold()
                            .foregroundColor(Color.greenForGroundColor)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 8.0)
                                .stroke(lineWidth: 0.9)
                                .foregroundColor(.gray)
                                .frame(width: 350, height: 50)
                            
                            TextField("\(defaultSettings.email)", text: $defaultSettings.email)
                                .frame(width: 320, height: 50)
                                .padding(.horizontal, 16)
                                .font(Font.custom("Karla-Medium", size: 18))
                                .foregroundColor(Color.greenForGroundColor)
                        }
                        
                        // Phone number
                        Text("Phone")
                            .font(Font.custom("Karla-Medium", size: 16)).bold()
                            .foregroundColor(Color.greenForGroundColor)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 8.0)
                                .stroke(lineWidth: 0.9)
                                .foregroundColor(.gray)
                                .frame(width: 350, height: 50)
                            
                            TextField("\(defaultSettings.phoneNumber)", text: $defaultSettings.phoneNumber)
                                .frame(width: 320, height: 50)
                                .padding(.horizontal, 16)
                                .font(Font.custom("Karla-Medium", size: 18))
                                .foregroundColor(Color.greenForGroundColor)
                        }
                    }.padding()
                    
                    // Nofitfications
                   
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Email Notifications")
                            .frame(width: 350, height: 18, alignment: .leading)
                            .foregroundColor(Color.greenForGroundColor)
                            .font(Font.custom("Karla-Medium", size: 20)).bold()
                        HStack {
                            Toggle(isOn: $defaultSettings.orderStatus, label: {}).toggleStyle(CheckboxToggleStyle())
                                .foregroundColor(Color.greenForGroundColor)
                            Text("Order statuses")
                                .font(.headline)
                        }
                        HStack {
                            Toggle(isOn: $defaultSettings.passwordChange, label: {}).toggleStyle(CheckboxToggleStyle())
                                .foregroundColor(Color.greenForGroundColor)
                            Text("Password changes")
                                .font(.headline)
                        }
                        HStack {
                            Toggle(isOn: $defaultSettings.specialOffers, label: {}).toggleStyle(CheckboxToggleStyle())
                                .foregroundColor(Color.greenForGroundColor)
                            Text("Special offers")
                                .font(.headline)
                        }
                        HStack {
                            Toggle(isOn: $defaultSettings.newsLetter, label: {}).toggleStyle(CheckboxToggleStyle())
                                .foregroundColor(Color.greenForGroundColor)
                            Text("Newsletter")
                                .font(.headline)
                        }
                    }
                    HStack{
                        Button(action: {
                            
                            self.isLoggedOut = true
                            defaultSettings.isLoggedIn = false
                            defaultSettings.name = ""
                            defaultSettings.lastName = ""
                            defaultSettings.email = ""
                            defaultSettings.phoneNumber = "(xxx)-xxx-xxxx)"
                            
                            defaultSettings.orderStatus = false
                            defaultSettings.passwordChange = false
                            defaultSettings.specialOffers = false
                            defaultSettings.newsLetter = false
                            
                        }, label: {
                            Text("Log out")
                                .frame(width: 360, height: 50)
                                .foregroundColor(.black)
                                .font(Font.custom("Karla-Medium", size: 20)).bold()
                                .background(Color.yellowBackGroundColor)
                                .cornerRadius(12)
                                .padding(.vertical, 20)
                        })
                    }
                    
                    // Bottom two buttons
                    HStack{
                        ZStack{
                            Button(action: {
                                
                                defaultSettings.name = ""
                                defaultSettings.lastName = ""
                                defaultSettings.email = ""
                                defaultSettings.phoneNumber = "(xxx)-xxx-xxxx)"
                                
                                defaultSettings.orderStatus = false
                                defaultSettings.passwordChange = false
                                defaultSettings.specialOffers = false
                                defaultSettings.newsLetter = false
                                
                            }, label: {
                                Text("Discard changes")
                                    .frame(width: 160, height: 50)
                                    .foregroundColor(Color.greenForGroundColor)
                                    .font(Font.custom("Karla-Medium", size: 20)).bold()
                                    .background(.clear)
                                    .border(Color.greenForGroundColor)
                                    .padding(.vertical, 12)
                            })
                        }.cornerRadius(12)
                        
                        Button(action: {
                           
                        }, label: {
                            Text("Save changes")
                                .frame(width: 160, height: 50)
                                .foregroundColor(.white)
                                .font(Font.custom("Karla-Medium", size: 20)).bold()
                                .background(Color.greenForGroundColor)
                                .cornerRadius(8)
                                .padding(.vertical, 20)
                        })
                    }
                }.navigationDestination(isPresented: $isLoggedOut, destination: {
                    OnBoarding()
                })
            }
        }.navigationBarBackButtonHidden(true)
    }
}
    
#Preview {
    UserProfile().environmentObject(DefaultStatesData())
}
