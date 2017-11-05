import Foundation

struct Language {
    let isoCode: String?
    let name: String?
}

//MARK: JSON Decodable

extension Language: JSONDecodable {
    
    static func decode(_ json: JSON) throws -> Language {
        return Language(isoCode: json["iso_639_1"].string,
                        name: json["name"].string)
    }
}
