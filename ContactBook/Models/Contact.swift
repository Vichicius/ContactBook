//
//  Contact.swift
//  ContactBook
//
//  Created by Luis Martinez on 11/2/25.
//

import SwiftUI
import SwiftData

@Model
class Contact {
    var image: Data?
    var name: String
    var phoneNumber: String
    var emailAddress: String
    
    init(image: Data? = nil, name: String, phoneNumber: String, emailAddress: String) {
        self.image = image
        self.name = name
        self.phoneNumber = phoneNumber
        self.emailAddress = emailAddress
    }
}

extension Contact {
    static func mockContact() -> [Contact] {
        return [
            Contact(image: nil, name: "Camavinga", phoneNumber: "650123456", emailAddress: "camavinga@realmadrid.com"),
            Contact(image: nil, name: "Kylian Mbappé", phoneNumber: "651120011", emailAddress: "kylian.mbappe@realmadrid.com"),
            Contact(image: nil, name: "Pedri", phoneNumber: "652128877", emailAddress: "pedri@fcnegreira.com"),
        ]
    }
}
