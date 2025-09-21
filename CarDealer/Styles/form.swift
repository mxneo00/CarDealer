//
//  form.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/18/25.
//

import SwiftUI

struct SectionHeaderStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
    }
}

struct FormFieldStyle: ViewModifier {
    @Environment(\.theme) var theme

    func body(content: Content) -> some View {
        content
            .textFieldStyle(.plain)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(theme.palette.textField)
            .cornerRadius(10)
            .foregroundColor(theme.palette.onPrimary)
    }
}

struct StyledSection<Content: View>: View {
    let title: String
    @ViewBuilder let content: () -> Content

    var body: some View {
        Section(
            header: Text(title).sectionHeaderStyle()
        ) {
            content()
        }
    }
}

struct FormStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .textFieldStyle(.plain)
            .font(.body)
            .tint(.purple)
    }
}

extension View {
    func formStyle() -> some View {
        self.modifier(FormStyle())
    }

    func formFieldStyle() -> some View{
        self.modifier(FormFieldStyle())
    }

    func sectionHeaderStyle() -> some View {
        self.modifier(SectionHeaderStyle())
    }
}

struct FormTemplateView: View {
    @State var name: String = ""

    var body: some View {
        ThemedBackground {
            VStack {
                StyledSection(title: "Name") {
                    TextField("Enter name", text: $name).formFieldStyle()
                }

                Button(action: something) {
                    text("Submit")
                }.buttonStyle(PillButtonStyle())
            }.formStyle()
        }
    }

    func something() {
        print("ok")
    }
}

#Preview {
    FormTemplateView()
}
