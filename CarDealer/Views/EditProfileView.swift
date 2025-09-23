//
//  EditProfileView.swift
//  LumeCars
//
//  Created by Katellyn Hyker on 9/23/25.
//

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
                Button(action: update) {
                    Text("Update")
                }.buttonStyle(PillButtonStyle())
            }.formStyle()
        }
    }
    
    func update() {
        userVM.updateEmail(email: userVM.user.email)
        userVM.updateName(fname: userVM.user.fname, lname: userVM.user.lname)
        userVM.updateImage(avatarURL: userVM.user.avatarURL)
    }
}
