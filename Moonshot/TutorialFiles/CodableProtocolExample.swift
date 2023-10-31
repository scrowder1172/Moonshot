//
//  CodableProtocolExample.swift
//  Moonshot
//
//  Created by SCOTT CROWDER on 10/31/23.
//

import SwiftUI

struct jsonUser: Codable {
    let name: String
    let age: String
    let address: jsonAddress
    let status: String
}

struct jsonAddress: Codable {
    let street: String
    let city: String
    let state: String
    let zip: String
}

struct CodableProtocolExample: View {
    let jsonData = """
    {
        "name": "Taylor Swift",
        "age": "29",
        "address": {
            "street": "555 Main Street",
            "city": "New Haven",
            "state": "FL",
            "zip": "00231"
        },
        "status": "single"
    }
    """
    
    let badJSONData = """
    {
        "name": "Taylor Swift",
        "age": "29",
        "address": {
            "street": {
                "number": "555",
                "streetName": "Main Street"
            }
            "city": "New Haven",
            "state": "FL",
            "zip": "00231"
        },
        "status": "single"
    }
    """
    
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var address: String = ""
    @State private var status: String = ""
    
    var body: some View {
        Text("Original JSON Data")
            .font(.title)
        Text(jsonData)
            .padding(.bottom, 20)
        CustomButton(label: "Decode JSON Data") {
            let data: Data = Data(jsonData.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(jsonUser.self, from: data) {
                print(user.address.city)
                name = user.name
                age = user.age
                address = "\(user.address.street), \(user.address.city), \(user.address.state) \(user.address.zip)"
                status = user.status
            } else {
                print("Unable to decode")
            }
        }
        HorizontalLine()
        HStack {
            Text("Name: \(name)")
            Text("Age: \(age)")
        }
        
        Text("Address: \(address)")
        Text("Relationship status: \(status)")
    }
}

#Preview {
    CodableProtocolExample()
}
