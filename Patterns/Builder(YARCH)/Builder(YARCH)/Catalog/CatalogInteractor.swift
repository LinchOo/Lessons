//
//  CatalogIteractor.swift
//  Builder(YARCH)
//
//  Created by Олег Коваленко on 19.01.2023.
//

import Foundation

protocol Interactor {
    init(presenter: Presenter)
}

class CatalogInteractor: Interactor{
    var presenter : Presenter!
    
    //Bussines logic
    
    required init(presenter: Presenter) {
        self.presenter = presenter
    }
}
