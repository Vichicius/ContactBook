//
//  ContactListView.swift
//  ContactBook
//
//  Created by Luis Martinez on 11/2/25.
//

import SwiftUI

struct ContactListView: View {
    
    @State var contacts: [Contact] = []
    @State var isPresentingCreationView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contacts) { contact in
                    NavigationLink {
                        //
                    } label: {
                        ContactRowView(contact: contact)
                    }
                }
                .onDelete(perform: deleteContacts)
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresentingCreationView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentingCreationView) {
                ContactCreationView()
            }
        }
    }
    
    func deleteContacts(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
    func addContact() {
        
    }
}

#Preview {
    ContactListView(contacts: Contact.mockContact())
}

