//
//  CatalogBuilder.swift
//  Builder(YARCH)
//
//  Created by Олег Коваленко on 19.01.2023.
//

import UIKit

class CatalogBuilder: BuilderModule {
    var title: String?
    
    func setTitle(_ title: String) -> CatalogBuilder {
        self.title = title
        return self
    }
    func build() -> UIViewController {
        guard let title = title else { fatalError("SetTitle") }
        let presenter = CatalogPresenter()
        let interactor = CatalogInteractor(presenter: presenter)
        let controller = CatalogViewController(title: title, interactor: interactor)
        presenter.viewController = controller
        
        return controller
    }
}
