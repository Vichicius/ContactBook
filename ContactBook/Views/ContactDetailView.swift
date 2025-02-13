//
//  ContactDetailView.swift
//  ContactBook
//
//  Created by Luis Martinez on 13/2/25.
//

import SwiftUI
import SwiftData

struct ContactDetailView: View {
    @Environment(\.modelContext) var modelContext: ModelContext
    @Environment(\.dismiss) var dismiss
    
    var contact: Contact
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if let imageData = contact.image, let image = UIImage(data: imageData) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundStyle(.gray)
                }
            }
            .frame(width: 144, height: 144)
            .clipShape(Circle())
            .frame(maxWidth: .infinity, maxHeight: nil)
            .padding(.bottom, 48)
            .padding(.top, 24)
            .background(.gray.opacity(0.5))
            
            Form {
                Section("Name") {
                    Text(contact.name)
                }
                Section("Phone number") {
                    Text(contact.phoneNumber)
                }
                
                Section {
                    Text(contact.emailAddress)
                } header: {
                    Text("Email")
                } footer: { // adds bottom margin for the next item in the form
                    Rectangle().frame(height:0)
                }

                Button {
                    modelContext.delete(contact)
                    dismiss()
                } label: {
                    Text("Delete contact")
                        .foregroundStyle(.red)
                }
            }
            .listSectionSpacing(.compact)
        }
        
    }
}

#Preview { // With image data
    ContactDetailView(contact: Contact.mockContact().first!)
}

#Preview { // No image data
    ContactDetailView(contact: Contact.mockContact().last!)
}
