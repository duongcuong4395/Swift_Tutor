//
//  CatsService.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 5/16/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//


import RxSwift
import Alamofire

class CatsService {
    
    // CityService
    private lazy var httpService = CatService()
    static let shared : CatsService = CatsService()
}


extension CatsService : CatsAPI {
    func createCat() -> Observable<[CatElement]> {
        return Observable.create({ observer in
            do {
                try CatHttpRouter.createCat
                    .request(usingHttpService: self.httpService)
                    .responseJSON { (result) in
                        do {
                            let cities = try CatsService.parseCats(result: result)
                            observer.onNext(cities)
                            observer.onCompleted()
                            
                        } catch {
                            observer.onError(error)
                        }
                }
            } catch {
                observer.onError(CustomError.error(message: "Cat fetch failed"))
            }
            return Disposables.create()
        })
    }
    
    
    
    
    func fetchCats() -> Observable<[CatElement]> {
        
        return Observable.create({ observer in
            do {
                try CatHttpRouter.getCats
                    .request(usingHttpService: self.httpService)
                    .responseJSON { (result) in
                        do {
                            let cities = try CatsService.parseCats(result: result)
                            observer.onNext(cities)
                            observer.onCompleted()
                            
                        } catch {
                            observer.onError(error)
                        }
                }
            } catch {
                observer.onError(CustomError.error(message: "Cat fetch failed"))
            }
            return Disposables.create()
        })
    }
}

extension CatsService {
    static func parseCats(result: AFDataResponse<Any>) throws  -> [CatElement] {
        guard
            let data = result.data,
            let catsResponse = try? JSONDecoder().decode([CatElement].self, from: data)
            else {
                throw CustomError.error(message: "Invalid Cats Json")
        }
        return catsResponse
    }
}
