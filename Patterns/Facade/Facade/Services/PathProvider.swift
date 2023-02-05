//
//  PathProvider.swift
//  Facade
//
//  Created by Олег Коваленко on 21.01.2023.
//

import Foundation

class PathProvider {
    func createDestinationPath(fileName: String) throws -> URL {
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            throw ImageSaverError.couldNotCreadeDestinationPath
        }
        let destinationPath = path.appendingPathComponent("\(fileName)")
        print(destinationPath)
        return destinationPath
    }
}
