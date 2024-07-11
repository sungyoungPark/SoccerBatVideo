//
//  DetailMatchReactor.swift
//  SoccerBatVideoSwift
//
//  Created by 박성영 on 7/12/24.
//

import Foundation
import RxSwift
import RxCocoa
import ReactorKit


class DetailMatchReactor : Reactor {
    
    let initialState : State
   
    enum Action {
     
    }
    
    enum Mutation {
       
    }
    
    struct State {
        var matchFeedData : FeedData?
    }
    
    init(feedData: FeedData?) {
        self.initialState = State(matchFeedData: feedData)
    }
    
}
