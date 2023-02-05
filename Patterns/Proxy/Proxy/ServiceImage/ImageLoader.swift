//
//  ImageLoader.swift
//  Proxy
//
//  Created by Олег Коваленко on 19.01.2023.
//

import Foundation

class ImageLoader: LoadServiceProtocol {
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        let session = URLSession.init(configuration: config)
        session.dataTask(with: url, completionHandler: completion).resume()
    }
}
