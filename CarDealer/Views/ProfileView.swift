//
//  ProfileView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//
// Profile View containing User information, Users listings, and users liked cars
// Edit Profile View

import SwiftUI
import SwiftData

struct EditProfileView: View {
    @EnvironmentObject var session: Session
    @ObservedObject var userVM: UserVM
    
    init(userVM: UserVM) {
        self.userVM = userVM
    }
    
    var body: some View {
        ThemedBackground {
            VStack {
                StyledSection(title: "Email") {
                    TextField("email", text: $userVM.user.email).formFieldStyle()
                }
                StyledSection(title: "First Name") {
                    TextField("first name", text: $userVM.user.fname).formFieldStyle()
                }
                StyledSection(title: "Last Name") {
                    TextField("last name", text: $userVM.user.lname).formFieldStyle()
                }
                StyledSection(title: "Profile Picture") {
                    CameraRollView()
                }
                // TODO: Update Profile Image
                Button(action: update) {
                    Text("Update")
                }.buttonStyle(PillButtonStyle())
            }.formStyle()
        }
    }
    
    func update() {
        userVM.updateEmail(email: userVM.user.email)
        userVM.updateName(fname: userVM.user.fname, lname: userVM.user.lname)
    }
}

struct ProfileView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var session: Session
    
    @Query(filter: #Predicate<User> { $0.email == "test@example.com"})
     var users: [User]
    
    var body: some View {
        NavigationStack {
            ThemedBackground {
                if let user = session.currentUser {
                    VStack(spacing: 20) {
                        ProfileSection(user: user)
                        HStack {
                            //TODO: Implement editing
                            NavigationLink(destination: EditProfileView(userVM: UserVM(user: session.currentUser!))) {
//                                Button("Edit Profile") {
//                                    print("Navigating to Edit View")
//                                }.buttonStyle(PillButtonStyle())
                                Text("Edit Profile")
                            }
                            Spacer()
                            Button("Logout") {
                                session.logout()
                            }.buttonStyle(PillButtonStyle())
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                    .navigationTitle("Profile")
                } else {
                    Text("No user signed in")
                        .navigationTitle("Profile")
                }
            }
        }
    }
}

// User Profile Section
struct ProfileSection: View {
    @EnvironmentObject var session: Session
    let user: User
    
    var body: some View {
            VStack {
                Image(session.currentUser!.avatarURL)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.blue, lineWidth: 6))
                    .padding(20)

                ZStack {
                    Rectangle()
                        .fill(.white)
                        //.ignoreSafeArea(edges: .all)
                    VStack(alignment: .leading) {
                        StyledSection(title: "Name") {
                            if let user = session.currentUser {
                                Text(user.name())
                            } else {
                                Text("No name")
                            }
                        }
                        Spacer()
                        StyledSection(title: "Email") {
                            Text(session.currentUser!.email)
                        }
                        Spacer()
                    }.padding(48)
                }
            }
    }
}


//#Preview {
//    let container = try! ModelContainer(for: User.self, Car.self, Listing.self, Like.self)
//    let context = ModelContext(container)
//    
//    ProfileView()
//        .environmentObject(Session.preview)
//}
