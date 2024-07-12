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
        case returnToDetailMatchFeed(IndexPath)
    }
    
    struct State {
        var feedDatas: [FeedData?] = []
        var selectedMatchFeed : FeedData?
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action{
        case .listUp:
            return JsonManager.shared.getJson()
                .map { data in
                    return .loadJson(data)
                }
            
        case .selectMatch(let index):
            return Observable.just(.returnToDetailMatchFeed(index))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation{
        case .loadJson(let feedDatas) :
            newState.feedDatas = feedDatas
        case .returnToDetailMatchFeed(let index) :
            newState.selectedMatchFeed = newState.feedDatas[index.row]
        }
        return newState
    }
    
}
