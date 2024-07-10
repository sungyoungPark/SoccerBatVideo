//
//  MatchFeedViewCell.swift
//  SoccerBatVideoSwift
//
//  Created by 박성영 on 7/10/24.
//

import UIKit
import SnapKit

class MatchFeedViewCell: UITableViewCell {

    private let mainStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 16
        
        return stackView
    }()

    private let rightStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let thumbImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        
        return label
    }()
    
    private let competitionLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.contentView.addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(8)
            make.bottom.equalTo(-8)
        }
        
        mainStackView.addArrangedSubview(thumbImageView)
        
        thumbImageView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(55)
          
        }
        
        mainStackView.addArrangedSubview(rightStackView)
        
        
        rightStackView.addArrangedSubview(titleLabel)
        rightStackView.addArrangedSubview(competitionLabel)
    }
    
    func configure(with item: FeedData) {
        
        ImageManager.shared.setImage(link: item.thumbnail, size: CGSize(width: 100, height: 55)) { [weak self] thumb in
            self?.thumbImageView.image = thumb
        }
        
        titleLabel.text = item.title
        competitionLabel.text = item.competition
    }
    
}
