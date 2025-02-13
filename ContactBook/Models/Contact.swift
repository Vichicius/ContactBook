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
            Contact(image: UIImage(resource: .camavinga).jpegData(compressionQuality: 1), name: "Camavinga", phoneNumber: "650123456", emailAddress: "camavinga@realmadrid.com"),
            Contact(image: UIImage(resource: .mbappe).jpegData(compressionQuality: 1), name: "Kylian Mbappé", phoneNumber: "651120011", emailAddress: "kylian.mbappe@realmadrid.com"),
            Contact(image: nil, name: "Pedri", phoneNumber: "652128877", emailAddress: "pedri@fcnegreira.com"),
            Contact(image: nil, name: "Tchouameni", phoneNumber: "650123456", emailAddress: "tchouameni@realmadrid.com"),
            Contact(image: nil, name: "Vini", phoneNumber: "651120011", emailAddress: "vini@realmadrid.com"),
            Contact(image: nil, name: "Gavi", phoneNumber: "652128877", emailAddress: "gavi@fcnegreira.com"),
            Contact(image: UIImage(resource: .olmo).jpegData(compressionQuality: 1), name: "Dani Olmo", phoneNumber: "650123456", emailAddress: "daniolmo@fcnegreira.com"),
            Contact(image: nil, name: "Ceballos", phoneNumber: "651120011", emailAddress: "ceballos@realmadrid.com"),
            Contact(image: nil, name: "Curtua", phoneNumber: "652128877", emailAddress: "curtua@realmadrid.com"),
        ]
    }
}
