//
//  CameraRoll.swift
//  LumeCars
//
//  Created by Katellyn Hyker on 9/23/25.
//
// Camera Roll and Image Selector

import SwiftUI
import PhotosUI

struct CameraRoll: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> UIViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: CameraRoll
        
        init(parent: CameraRoll) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let provider = results.first?.itemProvider, provider.canLoadObject(ofClass: UIImage.self) else { return }
            
            provider.loadObject(ofClass: UIImage.self) { image, arg in
                DispatchQueue.main.async {
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
}

struct CameraRollView: View {
    @State private var showPicker = false
    @State var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image).resizable().scaledToFit()
            }
            Button("Select Photo") {
                showPicker = true
            }.sheet(isPresented: $showPicker) {
                CameraRoll(image: $selectedImage)
            }
        }
    }
}
