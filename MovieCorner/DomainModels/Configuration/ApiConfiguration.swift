struct ApiConfiguration {
    let imageConfiguration: ImageConfiguration
}

//MARK: JSON Decodable

extension ApiConfiguration: JSONDecodable {
    static func decode(_ json: JSON) throws -> ApiConfiguration {
        return ApiConfiguration(imageConfiguration: try ImageConfiguration.decode(json["images"]))
    }
}
