import Foundation

struct Genre {
    let id: Int
    let name: String
}

//MARK: JSON Decodable

extension Genre: JSONDecodable {

    static func decode(_ json: JSON) throws -> Genre {
        return Genre(id: json["id"].intValue,
                     name: json["name"].stringValue)
    }
}
