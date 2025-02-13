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
    
    @State var isPresentingCreationView = false
    @State var searchedText: String = ""
    
    @Query var contacts: [Contact] = []
    
    var filteredContacts: [Contact] {
        guard !searchedText.isEmpty else {
            return contacts
        }

        return contacts.filter {
            $0.name.lowercased().contains(searchedText.lowercased())
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredContacts) { contact in
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
            .searchable(text: $searchedText, prompt: "Search")

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

