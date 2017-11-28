//
//  Configuration.swift
//  MovieCorner
//
//  Created by Aleksandar Simic on 11/12/17.
//  Copyright © 2017 Slick. All rights reserved.
//
import Foundation

struct Configuration {
    fileprivate let configuration: ApplicationConfiguration
    
    fileprivate init(configuration: ApplicationConfiguration = Configuration.currentConfiguration) {
        self.configuration = configuration
    }
}

//MARK: Singleton
extension Configuration {
    private static var _instance: Configuration?
    
    public static var instance: Configuration {
        guard let instance = _instance else {
            _instance = Configuration()
            return _instance!
        }
        
        return instance
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
    
    public var appName: String {
        return configuration.appName
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
