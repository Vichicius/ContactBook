//
//  ContactListView.swift
//  ContactBook
//
//  Created by Luis Martinez on 11/2/25.
//

import SwiftUI
import SwiftData

struct ContactListView: View {
    @Environment(\.modelContext) var modelContext: ModelContext
    @Query var contacts: [Contact] = []
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
        let contactToDelete = contacts[offsets.first!]
        modelContext.delete(contactToDelete)
    }
}

#Preview {
    ContactListView()
}

