import Foundation
enum API {
    
    //MARK: Movies
    case getPopularMovies(language: String, page: Int, region: String)
    case getMovieDetails(id: Int, language: String)
    case getCredits(movieId: Int)
    case getImages(movieId: Int, language: String)
    case getVideos(movieId: Int, language: String)
    case getRecommendedMovies(movieId: Int, language: String, page: Int)
    case getSimilarMovies(movieId: Int, language: String, page: Int)
    case getReviews(movieId: Int, language: String, page: Int)
    case getNowPlayingMovies(language: String, page: Int, region: String)
    case getTopRatedMovies(language: String, page: Int, region: String)
    case getUpcomingMovies(language: String, page: Int, region: String)
}

//MARK: HTTP Methods

extension API {
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
}

//MARK: Paths

extension API {
    var path: String {
        switch self {
        case .getPopularMovies:
            return "/movie/popular"
        case .getMovieDetails(let id, _):
            return "/movie/\(id)"
        case .getCredits(let movieId):
            return "/movie/\(movieId)/credits"
        case .getImages(let movieId, _):
            return "/movie/\(movieId)/images"
        case .getVideos(let movieId, _):
            return "/movie/\(movieId)/videos"
        case .getRecommendedMovies(let movieId, _, _):
            return "/movie/\(movieId)/recommendations"
        case .getSimilarMovies(let movieId, _, _):
            return "/movie/\(movieId)/similar"
        case .getReviews(let movieId, _, _):
            return "/movie/\(movieId)/reviews"
        case .getNowPlayingMovies:
            return "/movie/now_playing"
        case .getTopRatedMovies:
            return "/movie/top_rated"
        case .getUpcomingMovies:
            return "/movie/upcoming"
        }
    }
}

//MARK: Parameters
extension API {
    struct Parameter {
        static let language = "language"
        static let page = "page"
        static let region = "region"
        static let apiKey = "api_key"
    }
    
    private static var defaultParameters: HTTPParameters {
        return [Parameter.apiKey: Configuration.instance.apiKey]
    }
    
    private static var noParameters: HTTPParameters {
        return [:]
    }
    
    var parameters: HTTPParameters {
        switch self {
        case let .getPopularMovies(language, page, region),
             let .getNowPlayingMovies(language, page, region),
             let .getTopRatedMovies(language, page, region),
             let .getUpcomingMovies(language, page, region):
            return [Parameter.language: language, Parameter.page: page, Parameter.region: region]
        case .getMovieDetails(_, let language),
             .getImages(_, let language),
             .getVideos(_, let language):
            return [Parameter.language: language]
        case let .getRecommendedMovies(_, language, page),
             let .getSimilarMovies(_, language, page),
             let .getReviews(_, language, page):
            return [Parameter.language: language, Parameter.page: page]
        default:
            return API.noParameters
        }
    }
}
