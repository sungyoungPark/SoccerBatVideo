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
        case selectMatch(IndexPath)
    }
    
    enum Mutation {
        case loadJson([FeedData?])
        case goToDetailMatch
    }
    
    struct State {
        var feedDatas: [FeedData?] = []
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action{
        case .listUp:
            return JsonManager.shared.getJson()
                .map { data in
                    return .loadJson(data)
                }
            
        case .selectMatch(let index):
            return Observable<Mutation>.just(.goToDetailMatch)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation{
        case .loadJson(let feedDatas) :
            newState.feedDatas = feedDatas
        case .goToDetailMatch :
            print("gotoDetail")
        }
        return newState
    }
    
}
