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
                    CameraRollView { image in
                        if let path = saveImageToDocuments(image: image) {
                            userVM.user.avatarURL = path
                        }
                    }
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
    
    func saveImageToDocuments(image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 0.8) else {return nil}
        let filename = UUID().uuidString + ".jpg"
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(filename)
        do {
            try data.write(to: url)
            return url.path
        } catch {
            print("Error saving image")
            return nil
        }
    }
}
