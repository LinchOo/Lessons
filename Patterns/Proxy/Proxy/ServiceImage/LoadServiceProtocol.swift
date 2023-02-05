//
//  LocalServiceProtocol.swift
//  Proxy
//
//  Created by Олег Коваленко on 19.01.2023.
//

import Foundation
protocol LoadServiceProtocol {
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}
