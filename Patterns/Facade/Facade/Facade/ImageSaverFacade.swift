//
//  ImageSaverFacade.swift
//  Facade
//
//  Created by Олег Коваленко on 21.01.2023.
//

import UIKit

class ImageSaverFacade {
    private let pathProvider = PathProvider()
    private let dataProvider = ImageDataProvider()
    
    public func save(image: UIImage, type: ImageType, fileName: String, overwrite: Bool) throws {
        let destinationUrl = try pathProvider.createDestinationPath(fileName: fileName)
        let imageData = try dataProvider.data(from: image, type: type)
        let writeOptions: Data.WritingOptions = overwrite ? (.atomic) : (.withoutOverwriting)
        try imageData.write(to: destinationUrl, options: writeOptions)
    }
}












