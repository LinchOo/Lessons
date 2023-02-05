//
//  ViewController.swift
//  Facade
//
//  Created by Олег Коваленко on 21.01.2023.
//

import UIKit

enum ImageSaverError: Error {
    case couldNotCreadeDestinationPath
    case couldNotCreateJPEGDataFromImage
    case couldNotCreatePNGDataFromImage
    case couldNotSaveImageDestionationPath
}
enum ImageType {
    case png
    case jpeg(compressionQuality: CGFloat)
}

class ViewController: UIViewController {
    
    let imageSaver = ImageSaverFacade()
    let image = UIImage(named: "image")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try imageSaver.save(image: image, type: .png, fileName: "my_new_image", overwrite: true)
        } catch {
            print(error)
        }
    }

    

}

