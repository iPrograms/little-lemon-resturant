import SwiftUI

// DefaultStatesData keeps all the default data
// in the Environment, so all Views can access it.
class DefaultStatesData: ObservableObject {
    // Login
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var search: String = ""
    @Published var isLoggedIn: Bool = false
    // Profile
    @Published var lastName: String = ""
    @Published var phoneNumber:String = "(xxx)-xxx-xxxx)"
    
    // Profile notifications
    @Published var orderStatus:Bool = false
    @Published var passwordChange:Bool = false
    @Published var specialOffers:Bool = false
    @Published var newsLetter:Bool = false
    @Published var searchText: String = ""
}

extension Color {
    
    static let  greenForGroundColor: Color = Color(red: 73/255, green: 94/255, blue: 87/255, opacity: 1.0)
    static let yellowBackGroundColor: Color = .init(red: 244.0/255, green: 206.0/255, blue: 20.0/255, opacity: 1.0)
    static let priceClolor: Color = Color(red:238/255, green: 153/255, blue: 114/255, opacity: 1.0)
    static let buttonColor: Color = Color(red: 244.0/255, green: 206.0/255, blue: 20.0/255, opacity: 1.0)
}

struct OnBoarding: View {
    
    let kFirstName = ""
    let kLastName = ""
    let kEmail = ""
    
    @EnvironmentObject var defaultStates : DefaultStatesData
    // Check input
    func validateInput(name: String, email: String) -> Bool {
        if name.isEmpty {
            print("invalid first name")
            return false
        }
        if email.isEmpty {
            print("invalid email")
            return false
        }
        print("valid input")
        print("name: \(name)")
        print("email: \(email)")
        
        UserDefaults.standard.set("\(kFirstName)", forKey: defaultStates.email)
        UserDefaults.standard.set("\(kLastName)", forKey: defaultStates.lastName)
        UserDefaults.standard.set("\(kEmail)", forKey: defaultStates.email)
        
        return true
    }
    
    var body: some View {
        // Main frame
        NavigationStack{
                HStack {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 400, height: 60, alignment: .center)
                        .padding(.bottom, 15)
                        .padding(.top, 15)
                }
                VStack{
                    Hero()
                }
                
                // Input holding frame
                VStack(alignment: .center, spacing: 10.0) {
                    // First name
                    VStack(alignment: .leading) {
                        Text("First Name*")
                            .font(Font.title2)
                            .foregroundColor(.gray)
                        
                        TextField("First Name", text: $defaultStates.name)
                            .padding(.leading, 20.0)
                            .padding(.vertical, 5.0)
                            .frame(width: 350, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 0.8)
                                    .stroke(Color.gray)
                            )
                            .font(.custom("Karla-Light", fixedSize: 20))
                            .foregroundColor(Color.greenForGroundColor)
                    }
                    .padding(.top, 10)
                    VStack(alignment: .leading) {
                        Text("Last Name*")
                            .font(Font.title2)
                            .foregroundColor(.gray)
                        
                        TextField("Last Name", text: $defaultStates.lastName)
                            .padding(.leading, 20.0)
                            .padding(.vertical, 5.0)
                            .frame(width: 350, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 0.8)
                                    .stroke(Color.gray)
                            )
                            .font(.custom("Karla-Light", fixedSize: 20))
                            .foregroundColor(Color.greenForGroundColor)
                    }
                    .padding(.top, 10)
                    // Email
                    VStack(alignment: .leading) {
                        Text("Email*")
                            .font(Font.title2)
                            .foregroundColor(.gray)
                        
                        TextField("Email", text: $defaultStates.email)
                            .padding(.all, 20.0)
                            .frame(width: 350, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 0.8)
                                .stroke(Color.gray)
                            )
                            .font(.custom("Karla-Light", fixedSize: 20))
                            .foregroundColor(Color.greenForGroundColor)
                    }
                    // Login button
                    VStack(alignment: .leading) {
                        Button(action: {
                            if validateInput(name: defaultStates.name,
                                             email: defaultStates.email) {
                                
                                defaultStates.isLoggedIn = true
                                
                                UserDefaults.standard.set(defaultStates.name, forKey: kFirstName)
                                UserDefaults.standard.set(defaultStates.email, forKey: kEmail)
                                
                                print("User logged in : \(defaultStates.isLoggedIn)")
                                
                            }
                        }) {
                            LoginButton()
                        }
                    }
                }
                .navigationDestination(isPresented: $defaultStates.isLoggedIn, destination: {
                 Home()
                })
            }
        }
    }

#Preview {
    OnBoarding()
        .environmentObject(DefaultStatesData())
}
