//
//  SectionHeader.swift
//  PhotosApp
//
//  Created by Aisaule Sibatova on 16.03.2023.
//

import UIKit
import SnapKit

class SectionHeader: UICollectionReusableView {
    
    // MARK: - State
    
    static let identifier = "SectionHeader"
    
    // MARK: - UI Components
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.text = "Title"
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder:NSCoder){
        fatalError("Error in Cell")
    }
    
    // MARK: - Setup View
    
    private func setupView(){
        addSubview(title)
    }
    
    private func setupLayout(){
        title.snp.makeConstraints{make in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
}
