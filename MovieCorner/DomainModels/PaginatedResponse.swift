struct PaginatedResponse<Entity: JSONDecodable> {
    let page: Int
    let results: [Entity]
    let totalResults: Int
    let totalPages: Int
}

//MARK: JSON Decodable

extension PaginatedResponse: JSONDecodable {
    
    static func decode(_ json: JSON) throws -> PaginatedResponse<Entity> {
        return PaginatedResponse<Entity>(page: json["page"].intValue,
                                         results: try Entity.decode(json["results"].arrayValue),
                                         totalResults: json["total_results"].intValue,
                                         totalPages: json["total_pages"].intValue)
    }
}
