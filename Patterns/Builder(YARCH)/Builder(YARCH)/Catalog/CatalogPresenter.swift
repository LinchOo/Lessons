//
//  CatalogPresenter.swift
//  Builder(YARCH)
//
//  Created by Олег Коваленко on 19.01.2023.
//

import Foundation

protocol Presenter {
    var messageInfo: String{get}
}
class CatalogPresenter: Presenter {
    weak var viewController: CatalogViewController?
    var messageInfo = "Create viewModel for present"
}
