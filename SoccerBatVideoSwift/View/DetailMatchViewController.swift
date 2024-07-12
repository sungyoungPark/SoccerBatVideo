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
        stackView.backgroundColor = .white
        return stackView
    }()
    
    let videoWebView : WKWebView = {
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
        
        let height = UIScreen.main.bounds.width / 4 * 3
        videoWebView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(height)
        }
        
    }
    
    
    func bind(reactor: DetailMatchReactor) {
        reactor.state
            .map { $0.matchFeedData?.videos.first?.embed }
            .distinctUntilChanged()
            .compactMap { $0 }
            .bind(to: rx.loadHtmlString)
            .disposed(by: disposeBag)
    }

}


extension Reactive where Base: DetailMatchViewController {
    var loadHtmlString : Binder<String> {
        return Binder(self.base) { viewController, htmlString in
            viewController.videoWebView.loadHTMLString(htmlString, baseURL: nil)
        }
    }
}
