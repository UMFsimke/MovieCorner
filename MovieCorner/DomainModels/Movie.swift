struct Movie {
    let adult: Bool?
    let backdropPath: String?
    let belongsToCollection: Collection?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbId: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [Country]?
    let releaseDate: String?
    let revenue: Int?
    let runtime: Int?
    let spokenLanguages: [Language]?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
}

//MARK: JSON Decodable

extension Movie: JSONDecodable {
    
    static func decode(_ json: JSON) throws -> Movie {
        return Movie(adult: json["adult"].bool,
                     backdropPath: json["backdrop_path"].string,
                     belongsToCollection: try? Collection.decode(json["belongs_to_collection"]),
                     budget: json["budget"].int,
                     genres: try Genre.decode(json["genres"].array),
                     homepage: json["homepage"].string,
                     id: json["id"].int,
                     imdbId: json["imdb_id"].string,
                     originalLanguage: json["original_language"].string,
                     originalTitle: json["original_title"].string,
                     overview: json["overview"].string,
                     popularity: json["popularity"].double,
                     posterPath: json["poster_path"].string,
                     productionCompanies: try ProductionCompany.decode(json["production_companies"].array),
                     productionCountries: try Country.decode(json["production_countries"].array),
                     releaseDate: json["release_date"].string,
                     revenue: json["revenue"].int,
                     runtime: json["runtime"].int,
                     spokenLanguages: try Language.decode(json["spoken_languages"].array),
                     status: json["status"].string,
                     tagline: json["tagline"].string,
                     title: json["title"].string,
                     video: json["video"].bool,
                     voteAverage: json["vote_average"].double,
                     voteCount: json["vote_count"].int)
    }
}
