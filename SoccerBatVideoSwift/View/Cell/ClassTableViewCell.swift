//
//  ClassTableViewCell.swift
//  KmoocSwift
//
//  Created by 박성영 on 2021/09/05.
//

import UIKit
import SnapKit

class ClassTableViewCell: UITableViewCell {
//     썸네일, 운영기관, 운영기간 정보
    let thumbImageView = UIImageView()
    
    let classLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    let agencyLabel = UILabel()
    let dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("init")
        setUI()
    }

        

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUI(){
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(thumbImageView)
        
        thumbImageView.snp.makeConstraints { (maker) in
            maker.leading.equalTo(10)
            maker.top.equalTo(10)
            maker.bottom.equalTo(-10)
            maker.width.equalTo(165)
        }
        
        let classLabelView = UIView()
        self.contentView.addSubview(classLabelView)
        classLabelView.snp.makeConstraints { (maker) in
            maker.top.equalTo(10)
            maker.trailing.equalTo(-10)
            maker.bottom.equalTo(-10)
            maker.leading.equalTo(thumbImageView.snp.trailing).offset(8)
        }
        
        classLabelView.addSubview(classLabel)
        classLabel.snp.makeConstraints { maker in
            maker.top.bottom.leading.trailing.equalTo(0)
        }
    }
    
    func drawCell(myClass : Class){

        
        ImageManager.shared.setImage(link: myClass.class_image.image["raw"]! , completion: { [weak self] (image) in
            self?.thumbImageView.image = image
        })

        classLabel.text = myClass.name
        
    }

    
    override func prepareForReuse() {
        thumbImageView.image = nil
        classLabel.text = ""
        print("reuse")
    }
}
