//
//  Network.swift
//  Net Tools
//
//  Created by Paul Spencer on 6/17/21.
//

import Foundation

func create_session() -> URLSession {
    let config = URLSessionConfiguration.default
    config.requestCachePolicy = .reloadIgnoringCacheData
    config.urlCache = nil
    return URLSession.init(configuration: config)
}
