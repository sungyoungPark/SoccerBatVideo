//
//  LibraryViewReactor.swift
//  KmoocSwift
//
//  Created by 박성영 on 7/9/24.
//

import Foundation
import RxSwift
import RxCocoa
import ReactorKit


class MatchViewReactor : Reactor {
    let initialState = State()
    
   
    enum Action {
        case listUp
    }
    
    enum Mutation {
        case loadJson([FeedData?])
    }
    
    struct State {
        var isUpdate : Bool = false
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action{
        case .listUp:
            return JsonManager.shared.getJson2()
                .map { data in
                    print(data.count)
                    return .loadJson(data)
                }
            
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation{
        case.loadJson :
            print("load")
        }
        return newState
    }
    
}
