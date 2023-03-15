//
//  AlbumListCell.swift
//  PhotosApp
//
//  Created by Aisaule Sibatova on 16.03.2023.
//

import UIKit
import SnapKit


class AlbumListCell: UICollectionViewCell {
    
    // MARK: - State
    
    static let identifier = "AlbumListCell"
    
    // MARK: - UI Components
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var picturesQuabtityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .lightGray
        return label
    }()
    
    private let rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    
    private let folderNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup View
    
    public func configure(with model : AlbumList) {
        iconImageView.image = model.image
        folderNameLabel.text = model.folderName
        switch model.rightImage {
        case .chevron:
            picturesQuabtityLabel.text = model.picturesQuantity
            rightImageView.image = UIImage(systemName: "chevron.right")
            
        case .lock:
            rightImageView.image = UIImage(systemName: "lock.fill")
        }
    }
    
    private func setupView() {
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(folderNameLabel)
        contentView.addSubview(picturesQuabtityLabel)
        contentView.addSubview(rightImageView)
        contentView.clipsToBounds = true
    }
    
    private func setupLayout() {
        iconContainer.snp.makeConstraints {make in
            make.leading.equalToSuperview().offset(8)
            make.height.equalTo(29)
            make.width.equalTo(30)
            make.centerY.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {make in
            make.edges.equalToSuperview().inset(3)
        }
        
        folderNameLabel.snp.makeConstraints {make in
            make.leading.equalTo(iconContainer.snp.leading).offset(42)
            make.centerY.equalToSuperview()
        }
        
        picturesQuabtityLabel.snp.makeConstraints{ make in
            make.trailing.equalTo(rightImageView.snp.leading).offset(-15)
            make.centerY.equalToSuperview()
        }
        
        rightImageView.snp.makeConstraints{make in
            make.trailing.equalToSuperview().offset(-18)
            make.centerY.equalToSuperview()
        }
    }
}
