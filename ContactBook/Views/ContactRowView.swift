//
//  ContactRowView.swift
//  ContactBook
//
//  Created by Luis Martinez on 12/2/25.
//

import SwiftUI

struct ContactRowView: View {
    
    var contact: Contact
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundColor(.blue)
                .padding(.trailing)
            VStack(alignment: .leading, spacing: 4) {
                Text(contact.name)
                    .font(.headline)
                    .padding(.top)
                Text(contact.emailAddress)
                    .font(.subheadline)
                Text(contact.phoneNumber)
                    .font(.subheadline)
            }
        }
    }
}
