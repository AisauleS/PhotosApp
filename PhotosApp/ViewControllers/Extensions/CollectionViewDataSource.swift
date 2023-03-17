//
//  CollectionViewDataSource.swift
//  PhotosApp
//
//  Created by Aisaule Sibatova on 16.03.2023.
//

import UIKit

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension AlbumViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return myAlbums.count
        case 1:
            return sharedAlbums.count
        case 2:
            return mediaTypes.count
        case 3:
            return utilities.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch indexPath.section {
        case 0:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: SectionHeader.identifier,
                                                                               for: indexPath) as? SectionHeader else { return UICollectionViewCell() }
            header.title.text = "My Albums"
            header.layer.addBorder(edge: .top, color: .lightGray, thickness: 0.5)
            return header
        case 1:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: SectionHeader.identifier,
                                                                         for: indexPath) as? SectionHeader else { return UICollectionViewCell() }
            header.title.text = "Shared Album"
            header.layer.addBorder(edge: .top, color: .lightGray, thickness: 0.5)
            return header
        case 2:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: SectionHeader.identifier,
                                                                         for: indexPath) as? SectionHeader else { return UICollectionViewCell() }
            header.title.text = "Media Types"
            header.layer.addBorder(edge: .top, color: .lightGray, thickness: 0.5)
            return header
        default:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: SectionHeader.identifier,
                                                                         for: indexPath) as? SectionHeader else { return UICollectionViewCell() }
            header.title.text = "My Utility"
            header.layer.addBorder(edge: .top, color: .lightGray, thickness: 0.5)
            return header
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumFoldersCell.identifier, for: indexPath) as? AlbumFoldersCell else { return UICollectionViewCell() }
            let model = myAlbums[indexPath.row]
            cell.configure(with: model)
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumFoldersCell.identifier, for: indexPath) as? AlbumFoldersCell else { return UICollectionViewCell() }
            let model = sharedAlbums[indexPath.row]
            cell.configure(with: model)
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumListCell.identifier, for: indexPath) as? AlbumListCell else { return UICollectionViewCell() }
            let model = mediaTypes[indexPath.row]
            cell.configure(with: model)
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumListCell.identifier, for: indexPath) as? AlbumListCell else { return UICollectionViewCell() }
            let model = utilities[indexPath.row]
            cell.configure(with: model)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumFoldersCell.identifier, for: indexPath) as? AlbumFoldersCell else { return UICollectionViewCell() }
            return cell
        }
    }
}
