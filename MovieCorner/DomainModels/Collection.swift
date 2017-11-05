struct Collection {
    let id: Int?
    let name: String?
    let overview: String?
    let posterPath: String?
    let backdropPath: String?
    //TODO: add parts
}

//MARK: JSON Decodable

extension Collection: JSONDecodable {
    
    static func decode(_ json: JSON) throws -> Collection {
        return Collection(id: json["id"].int,
                          name: json["name"].string,
                          overview: json["overview"].string,
                          posterPath: json["poster_path"].string,
                          backdropPath: json["backdrop_path"].string)
    }
}
