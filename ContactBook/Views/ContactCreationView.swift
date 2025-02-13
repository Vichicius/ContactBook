//
//  ContactCreationView.swift
//  ContactBook
//
//  Created by Luis Martinez on 12/2/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct ContactCreationView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext

    @State var contact = Contact(name: "", phoneNumber: "", emailAddress: "")
    
    @State var imageData: Data?
    
    var body: some View {
        NavigationStack {
            VStack() {
                AvatarPicker(imageData: $imageData)
                    .padding()
                
                Form {
                        TextField("Name", text: $contact.name)
                            .padding(.vertical, 8)
                        
                        TextField("Phone Number", text: $contact.phoneNumber)
                            .padding(.vertical, 8)
                        
                        TextField("Email Address", text: $contact.emailAddress)
                            .padding(.vertical, 8)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                }
                .background(Color(.systemBackground))
            }
            .padding(.vertical, 24)
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
            .navigationTitle("Create Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        saveContact()
                        dismiss()
                    } label: {
                        Text("Save")
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
    
    func saveContact() {
        do {
            contact.image = imageData
            modelContext.insert(contact)
            try modelContext.save()
        } catch {
            print(error)
        }
    }
}

#Preview {
    ContactCreationView()
}

struct AvatarPicker: View {
    
    @State var selectedPhoto: PhotosPickerItem?
    @State var selectedPhotoImage: Image?
    
    @Binding var imageData: Data?

    var body: some View {
        PhotosPicker(selection: $selectedPhoto,
                     matching: .images) {
            ZStack {
                if let selectedPhotoImage {
                    selectedPhotoImage
                        .resizable()
                        .scaledToFill()
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundColor(Color(.white))
                }
            }
            .frame(width: 144, height: 144)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .shadow(color: .gray.opacity(0.6), radius: 5, x: 0, y: 2)

        }
         .onChange(of: selectedPhoto) {
             Task {
                 if let image = try? await selectedPhoto?.loadTransferable(type: Image.self),
                    let data = try? await selectedPhoto?.loadTransferable(type: Data.self){
                     selectedPhotoImage = image
                     imageData = data
                 } else {
                     print("Failed to load image.")
                     selectedPhotoImage = nil
                 }
                 
             }
         }
    }
}
