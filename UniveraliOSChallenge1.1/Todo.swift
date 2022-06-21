//
//  Todo.swift
//  UniveraliOSChallenge1.1
//
//  Created by Joseph Castro on 6/14/22.
//

/*
 "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
 **/


//{
//  "results": [
//    {
//      "gender": "male",
//      "name": {
//        "title": "Mr",
//        "first": "کوروش",
//        "last": "سالاری"
//      },
//      "location": {
//        "street": {
//          "number": 4568,
//          "name": "کلاهدوز"
//        },
//        "city": "شهریار",
//        "state": "آذربایجان غربی",
//        "country": "Iran",
//        "postcode": 79452,
//        "coordinates": {
//          "latitude": "31.6544",
//          "longitude": "-151.4528"
//        },
//        "timezone": {
//          "offset": "-3:30",
//          "description": "Newfoundland"
//        }
//      },
//      "email": "khwrwsh.slry@example.com",
//      "login": {
//        "uuid": "f447f90c-fe8f-409b-ba67-03900d110ded",
//        "username": "happyladybug134",
//        "password": "pepsi1",
//        "salt": "96H0bKQl",
//        "md5": "9dd1b62252a5231dfcdc49e813ead1c0",
//        "sha1": "050481a933d475ec888f6b964c5c63d8d56e15a8",
//        "sha256": "1397e2ef877df05ceac2a4918b82f8983477c44c0294aca060e08858d3118f63"
//      },
//      "dob": {
//        "date": "1955-08-29T18:45:04.455Z",
//        "age": 67
//      },
//      "registered": {
//        "date": "2012-08-04T03:00:05.674Z",
//        "age": 10
//      },
//      "phone": "008-01088866",
//      "cell": "0910-530-7332",
//      "id": {
//        "name": "",
//        "value": null
//      },
//      "picture": {
//        "large": "https://randomuser.me/api/portraits/men/1.jpg",
//        "medium": "https://randomuser.me/api/portraits/med/men/1.jpg",
//        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/1.jpg"
//      },
//      "nat": "IR"
//    }
//  ],
//  "info": {
//    "seed": "e31462c42906e7f7",
//    "results": 1,
//    "page": 1,
//    "version": "1.3"
//  }
//}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Contact: Codable {
    let results: [Result]
    
}

// MARK: - Info
struct Info: Codable {
    let seed: String
  
}

// MARK: - Result
struct Result: Codable {
//    let gender: String
    let name: Name
//    let location: Location
    let email: String
//    let login: Login
//    let dob, registered: Dob
//    let phone, cell: String
//    let id: ID
    let picture: Picture
//    let nat: String
}

// MARK: - Dob
struct Dob: Codable {
    let date: String
    let age: Int
}

// MARK: - ID
struct ID: Codable {
    let name: String
    let value: JSONNull?
}

// MARK: - Location
struct Location: Codable {
    let street: Street
    let city, state, country: String
    let postcode: Int
    let coordinates: Coordinates
    let timezone: Timezone
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String
}

// MARK: - Street
struct Street: Codable {
    let number: Int
    let name: String
}

// MARK: - Timezone
struct Timezone: Codable {
    let offset, timezoneDescription: String

    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription = "description"
    }
}

// MARK: - Login
struct Login: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

//    public var hashValue: Int {
//        return 0
//    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

//[Todo]
