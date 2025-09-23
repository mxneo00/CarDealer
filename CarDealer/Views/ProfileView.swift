//
//  ProfileView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//
// Profile View containing User information, Users listings, and users liked cars

import SwiftUI
import SwiftData

struct ProfileView: View {
    @Environment(\.modelContext) private var ctx
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
                            NavigationLink(destination: EditProfileView(userVM: UserVM(user: session.currentUser!, ctx: ctx))) {
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
                //FIX: upon relog profile image reverts back to default
                if let avatarPath = session.currentUser?.avatarURL,
                   let uiImage = UIImage(contentsOfFile: avatarPath) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.black, lineWidth: 3))
                        .padding(20)
                } else {
                    Image("default_avatar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.black, lineWidth: 3))
                        .padding(20)
                }
                

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
                            if let user = session.currentUser {
                                Text(user.email)
                            } else {
                                Text("No Email")
                            }
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
