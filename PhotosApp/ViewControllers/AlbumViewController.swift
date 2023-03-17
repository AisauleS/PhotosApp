//
//  AlbumViewController.swift
//  PhotosApp
//
//  Created by Aisaule Sibatova on 16.03.2023.
//

import UIKit
import SnapKit

class AlbumViewController: UIViewController {
    
    // MARK: - State
    
    var myAlbums = [AlbumFolders]()
    var sharedAlbums = [AlbumFolders]()
    var mediaTypes = [AlbumList]()
    var utilities = [AlbumList]()
    
    lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AlbumFoldersCell.self, forCellWithReuseIdentifier: AlbumFoldersCell.identifier)
        collectionView.register(AlbumListCell.self, forCellWithReuseIdentifier: AlbumListCell.identifier)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)
        return collectionView
    }()
    
    // MARK: - Setup Layout
    
    private func createLayout() -> UICollectionViewCompositionalLayout{
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0:
                let itemSize  = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2), heightDimension: .fractionalWidth(1 / 1.8 * 2))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 5)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                let layoutSectionHeader = self.createSectionHeader()
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
                
            case 1:
                let itemSize  = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 1.12), heightDimension: .fractionalWidth(1 / 1.8))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: layoutItem, count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
                layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                let layoutSectionHeader = self.createSectionHeader()
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
                
            case 2:
                var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
                configuration.itemSeparatorHandler = { (indexPath, sectionSeparatorConfiguration) in
                    var configuration = sectionSeparatorConfiguration
                    configuration.bottomSeparatorInsets = .init(top: 0, leading: 50, bottom: 0, trailing: 0)
                    return configuration
                }
                let layoutSection = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment:layoutEnvironment)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 6, bottom: 0, trailing: 0)
                let layoutSectionHeader = self.createSectionHeader()
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
                
            case 3:
                var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
                configuration.itemSeparatorHandler = { (indexPath, sectionSeparatorConfiguration) in
                    var configuration = sectionSeparatorConfiguration
                    configuration.bottomSeparatorInsets = .init(top: 0, leading: 50, bottom: 0, trailing: 0)
                    return configuration
                }
                let layoutSection = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment:layoutEnvironment)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 6, bottom: 10, trailing: 0)
                let layoutSectionHeader = self.createSectionHeader()
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
                
            default:
                let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
                let layoutSection = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment:layoutEnvironment)
                return layoutSection
            }
        }
    }
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(30))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layoutSectionHeader
    }
    
    private func setupNavigationBar() {
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.setLeftBarButton(UIBarButtonItem(
            title: nil,
            image: UIImage(systemName: "plus"),
            primaryAction: UIAction(handler: {_ in self.dismiss(animated: true)}),
            menu: nil), animated: true)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        setupNavigationBar()
        uploadMyAlbumsData()
        uploadSharedAlbumsData()
        uploadMediaTypesData()
        uploadUtilitiesData()
    }
    
    // MARK: - Setup View
    
    private func setupView(){
        view.addSubview(collectionView)
    }
    
    private func setupLayout(){
        collectionView.snp.makeConstraints{make in
            make.left.top.right.bottom.equalTo(view)
        }
    }
}

