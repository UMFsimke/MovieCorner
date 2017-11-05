import Foundation

struct ProductionCompany {
    let id: Int
    let name: String
}


//MARK: JSON Decodable

extension ProductionCompany: JSONDecodable {
    
    static func decode(_ json: JSON) throws -> ProductionCompany {
        return ProductionCompany(id: json["id"].intValue,
                                 name: json["name"].stringValue)
    }
}
