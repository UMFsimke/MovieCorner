//
//  ApplicationConfiguration.swift
//  MovieCorner
//
//  Created by Aleksandar Simic on 11/11/17.
//  Copyright © 2017 Slick. All rights reserved.
//

protocol ApplicationConfiguration {
    var apiHost: String { get }
    var apiKey: String { get }
    var appName: String { get }
}

extension ApplicationConfiguration {
    var apiHost: String {
        return "https://api.themoviedb.org/3/"
    }
    
    var apiKey: String {
        return ApiConstants.apiKey
    }
    
    var appName: String {
        return "Movie Corner"
    }
}
