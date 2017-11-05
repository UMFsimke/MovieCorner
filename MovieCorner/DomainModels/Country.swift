import Foundation

struct Country {
    let isoCode: String?
    let name: String?
}

//MARK: JSON Decodable

extension Country: JSONDecodable {
    
    static func decode(_ json: JSON) throws -> Country {
        return Country(isoCode: json["iso_3166_1"].string,
                       name: json["name"].string)
    }
}
