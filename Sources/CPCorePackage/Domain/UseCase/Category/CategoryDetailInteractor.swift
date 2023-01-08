//
//  CategoryDetailInteractor.swift
//  Core
//
//  Created by septe habudin on 08/01/23.
//

import Foundation
import Combine
import RealmSwift

public protocol CategoryDetailUseCase {
    func getCategory() -> CategoryModel
    func categoryIsExist(category: CategoryModel) -> CategoryModel?
}

// create interactor detail
public class CategoryDetailInteractor: CategoryDetailUseCase {


    private let repository: CategoryRepositoryProtocol
    private let category: CategoryModel

    required init(
        repository: CategoryRepositoryProtocol,
        category: CategoryModel
    ) {
        self.repository = repository
        self.category = category
    }

    public func getCategory() -> CategoryModel {
        return category
    }

    public func categoryIsExist(category: CategoryModel) -> CategoryModel {
        let isExist =  realm.objects(FavoriteCategoryEntity.self).where {
            $0.id == category.id
        }.first

        return isExist
    }

}

