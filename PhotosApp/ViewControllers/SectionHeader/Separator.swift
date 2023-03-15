//
//  Separator.swift
//  PhotosApp
//
//  Created by Aisaule Sibatova on 16.03.2023.
//

import UIKit
import SnapKit

class Separator: UICollectionReusableView {
    
    // MARK: - State
    
    static let identifier = "Separator"
    
    // MARK: - UI Components
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
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
        addSubview(seperatorView)
    }
    
    private func setupLayout(){
        seperatorView.snp.makeConstraints{make in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.height.equalTo(0.5)
        }
    }
}

