extension String: JSONDecodable {
    static func decode(_ json: JSON) throws -> String {
        return json.stringValue
    }
}
