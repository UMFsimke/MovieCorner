
protocol JSONDecodable {
    static func decode(_ json: JSON) throws -> Self
}

extension JSONDecodable {
    static func decode(_ jsonArray: [JSON]?) throws -> [Self]? {
        guard let jsonArray = jsonArray else { return nil }
        
        return jsonArray.map({ self.decode($0) })
    }
    
    static func decode(_ jsonArray: [JSON]) throws -> [Self] {
        return jsonArray.map({ self.decode($0) })
    }
}
