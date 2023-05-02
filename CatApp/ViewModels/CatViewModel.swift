//
//  CatViewModel.swift
//  CatApp
//
//  Created by Andres Diaz Orozco on 30/04/23.
//

class CatViewModel {
    var cats: [Cat] = []
    
    func getCat(completion: @escaping () -> Void) {
        ApiCats.shared.getBreeds { [weak self] cats, _ in
            self?.cats = cats ?? []
            completion()
        }
    }
}
