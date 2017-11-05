
protocol JSONDecodable {
    static func decode(_ json: JSON) throws -> Self
}

extension JSONDecodable {
    static func decode(_ jsonArray: [JSON]?) throws -> [Self]? {
        guard let jsonArray = jsonArray else { return nil }
        
        return try jsonArray.map({ try self.decode($0) })
    }
    
    static func decode(_ jsonArray: [JSON]) throws -> [Self] {
        return try jsonArray.map({ try self.decode($0) })
    }
}
