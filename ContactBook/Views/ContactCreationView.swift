//
//  ContactCreationView.swift
//  ContactBook
//
//  Created by Luis Martinez on 12/2/25.
//

import SwiftUI

struct ContactCreationView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var contact = Contact(name: "", phoneNumber: "", emailAddress: "")
    
    var body: some View {
        NavigationStack {
            VStack() {
                // Profile Image
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
                    .padding()
                    .background(.gray.opacity(0.4))
                    .cornerRadius(100)
                
                // Form
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
        
    }
}

#Preview {
    ContactCreationView()
}

