struct Movie {
    let adult: Bool
    let backdropPath: String?
    let belongsToCollection: Collection?
    let budget: Int
    let genres: [Genre]
    let homepage: String?
    let id: Int
    let imdbId: String?
    let originalLanguage: String
    let originalTitle: String
    let overview: String?
    let popularity: Double
    let posterPath: String?
    let productionCompanies: [ProductionCompany]
    let productionCountries: [Country]
    let releaseDate: String
    let revenue: Int
    let runtime: Int?
    let spokenLanguages: [Language]
    let status: String
    let tagline: String?
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}

//MARK: JSON Decodable

extension Movie: JSONDecodable {
    
    static func decode(_ json: JSON) throws -> Movie {
        
        return Movie(adult: json["adult"].boolValue,
                     backdropPath: json["backdrop_path"].string,
                     belongsToCollection: try? Collection.decode(json["belongs_to_collection"]),
                     budget: json["budget"].intValue,
                     genres: try Genre.decode(json["genres"].arrayValue),
                     homepage: json["homepage"].string,
                     id: json["id"].intValue,
                     imdbId: json["imdb_id"].string,
                     originalLanguage: json["original_language"].stringValue,
                     originalTitle: json["original_title"].stringValue,
                     overview: json["overview"].string,
                     popularity: json["popularity"].doubleValue,
                     posterPath: json["poster_path"].string,
                     productionCompanies: try ProductionCompany.decode(json["production_companies"].arrayValue),
                     productionCountries: try Country.decode(json["production_countries"].arrayValue),
                     releaseDate: json["release_date"].stringValue,
                     revenue: json["revenue"].intValue,
                     runtime: json["runtime"].int,
                     spokenLanguages: try Language.decode(json["spoken_languages"].arrayValue),
                     status: json["status"].stringValue,
                     tagline: json["tagline"].string,
                     title: json["title"].stringValue,
                     video: json["video"].boolValue,
                     voteAverage: json["vote_average"].doubleValue,
                     voteCount: json["vote_count"].intValue)
    }
}
