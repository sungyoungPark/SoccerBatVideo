//
//  DetailMatchViewController.swift
//  SoccerBatVideoSwift
//
//  Created by 박성영 on 7/11/24.
//

import UIKit
import WebKit
import SnapKit
import ReactorKit
import RxSwift

class DetailMatchViewController: UIViewController, View {
    
    typealias Reactor = DetailMatchReactor
    
    var disposeBag: DisposeBag = DisposeBag()
    
    private let mainStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.backgroundColor = .yellow
        return stackView
    }()
    
    private let videoWebView : WKWebView = {
        let webView = WKWebView()
        
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    
    private func setupUI() {
        self.view.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainStackView.addArrangedSubview(videoWebView)
        videoWebView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(300)
        }
        
    }
    
    
    func bind(reactor: DetailMatchReactor) {
        reactor.state
            .map { $0.matchFeedData }
            .bind { feedData in
                guard let feeData = feedData else { return }
                guard let video = feeData.videos.first else { return }
                self.videoWebView.loadHTMLString(video.embed, baseURL: nil)
            }
            .disposed(by: disposeBag)
    }

}
