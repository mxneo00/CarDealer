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
    
    var body: some View {
        ThemedBackground {
            VStack {
                StyledSection(title: "Email") {
                    TextField("email", text: $userVM.user.email).formFieldStyle()
                }
                Button(action: updateEmail) {
                    Text("Update")
                }.buttonStyle(PillButtonStyle())
            }.formStyle()
        }
    }
    
    func updateEmail() {
        userVM.updateEmail(email: userVM.user.email)
    }
}

struct ProfileView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var session: Session
    
    @Query(filter: #Predicate<User> { $0.email == "test@example.com"})
     var users: [User]
    
    var body: some View {
        TabView {
            NavigationStack {
                ThemedBackground {
                    if let user = session.currentUser {
                        VStack(spacing: 20) {
                            ProfileSection(user: user)
                            HStack {
//                                NavigationLink("Edit Profile") {
//                                    EditProfileView()
//                                }
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
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle")
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
                // Redesigned
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
