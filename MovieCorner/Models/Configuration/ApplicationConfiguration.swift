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
}

extension ApplicationConfiguration {
    var apiKey: String {
        return ""
    }
}
