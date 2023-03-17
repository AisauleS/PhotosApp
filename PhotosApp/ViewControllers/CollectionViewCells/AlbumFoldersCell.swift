//
//  AlbumFoldersCell.swift
//  PhotosApp
//
//  Created by Aisaule Sibatova on 16.03.2023.
//

import UIKit

class AlbumFoldersCell: UICollectionViewCell {
    
    // MARK: - State
    
    static let identifier = "AlbumFoldersCell"
    
    // MARK: - UI Components
    
    private lazy var folderImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 6
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var folderNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var picturesQuabtityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private let folderStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = 0
        return stack
    }()
        
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    // MARK: - Setup View
    
    private func setupView() {
        addSubview(folderStack)
        folderStack.addArrangedSubview(folderImage)
        folderStack.addArrangedSubview(folderNameLabel)
        folderStack.addArrangedSubview(picturesQuabtityLabel)
    }
    
    private func setupLayout(){
        folderStack.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
        
        folderImage.snp.makeConstraints{make in
            make.height.equalTo(165)
        }
    }
    
    public func configure(with model: AlbumFolders){
        folderImage.image = model.image
        folderNameLabel.text = model.folderName
        picturesQuabtityLabel.text = model.picturesQuantity
    }
    
    override func prepareForReuse() {
        self.folderImage.image = nil
    }
}
