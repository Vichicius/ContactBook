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
            return contacts.sorted(by: { $0.name < $1.name})
        }

        return contacts.filter {
            $0.name.lowercased().contains(searchedText.lowercased())
        }.sorted(by: { $0.name < $1.name})
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredContacts) { contact in
                    NavigationLink {
                        ContactDetailView(contact: contact)
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
                
                ToolbarItem(placement: .secondaryAction) {
                    Button("Add mock contacts", systemImage: "person.crop.circle.badge.plus") {
                        Contact.mockContact().forEach( { modelContext.insert($0) } )
                    }
                }
                ToolbarItem(placement: .secondaryAction) {
                    Button("Remove all", systemImage: "person.crop.circle.fill.badge.minus") {
                        contacts.forEach( { modelContext.delete($0) } )
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
        let contactToDelete = filteredContacts[offsets.first!]
        modelContext.delete(contactToDelete)
    }
}

#Preview {
    let modelContainer: ModelContainer = {
        let modelContainer = try! ModelContainer(for: Contact.self, configurations: .init(isStoredInMemoryOnly: true))
        Contact.mockContact().forEach {
            modelContainer.mainContext.insert($0)
        }
        return modelContainer
    }()
    
    ContactListView()
        .modelContainer(modelContainer)
}

