//
//  ContactRowView.swift
//  ContactBook
//
//  Created by Luis Martinez on 12/2/25.
//

import SwiftUI
import PhotosUI

struct ContactRowView: View {
    
    var contact: Contact
    
    var body: some View {
        HStack {
            ZStack {
                if let data = contact.image, let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle")
                        .resizable()
                }
            }
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

#Preview {
    ContactRowView(contact: Contact(name: "Fernando Alonso", phoneNumber: "654321987", emailAddress: "fer@gmail.com"))
}
