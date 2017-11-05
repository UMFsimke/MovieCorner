struct ImageConfiguration {
    let baseUrl: String
    let secureBaseUrl: String
    let backdropSizes: [String]
    let logoSizes: [String]
    let posterSizes: [String]
    let profileSizes: [String]
    let stillSizes: [String]
}

//MARK: JSON Decodable

extension ImageConfiguration: JSONDecodable {
    static func decode(_ json: JSON) throws -> ImageConfiguration {
        return ImageConfiguration(baseUrl: json["base_url"].stringValue,
                                  secureBaseUrl: json["secure_base_url"].stringValue,
                                  backdropSizes: try String.decode(json["backdrop_sizes"].arrayValue),
                                  logoSizes: try String.decode(json["logo_sizes"].arrayValue),
                                  posterSizes: try String.decode(json["poster_sizes"].arrayValue),
                                  profileSizes: try String.decode(json["profile_sizes"].arrayValue),
                                  stillSizes: try String.decode(json["still_sizes"].arrayValue))
    }
}
