//
//  Configuration.swift
//  MovieCorner
//
//  Created by Aleksandar Simic on 11/12/17.
//  Copyright © 2017 Slick. All rights reserved.
//

struct Configuration {
    fileprivate let configuration: ApplicationConfiguration
    
    init(configuration: ApplicationConfiguration = Configuration.currentConfiguration) {
        self.configuration = configuration
    }
}

//MARK: Application configuration variables

extension Configuration {
    public var apiHost: String {
        return configuration.apiHost
    }
    
    public var apiKey: String {
        return configuration.apiKey
    }
}

//MARK: Runtime determination

fileprivate extension Configuration {
    static var current: ConfigurationFlavor {
        guard
            let infoDictionary = Bundle.main.infoDictionary,
            let configurationName = infoDictionary["Configuration"] as? String,
            let buildConfiguration = ConfigurationFlavor(rawValue: configurationName)
            else { return .Release }
        
        return buildConfiguration
    }
    
    static var currentConfiguration: ApplicationConfiguration {
        switch current {
        case .Release, .Beta:
            return ReleaseConfiguration()
        case .Test:
            return TestConfiguration()
        }
    }
}
