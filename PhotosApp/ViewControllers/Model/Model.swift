//
//  Model.swift
//  PhotosApp
//
//  Created by Aisaule Sibatova on 16.03.2023.
//

import UIKit

// MARK: - Model Structs

protocol AlbumsSection {
    var image: UIImage? { get set }
    var folderName: String {get set}
    var picturesQuantity: String? {get set}
}

struct AlbumFolders: AlbumsSection {
    var image: UIImage?
    var folderName: String
    var picturesQuantity: String?
}

struct AlbumList: AlbumsSection {
    enum rightImageName {
        case chevron, lock
    }
    var image: UIImage?
    var folderName: String
    var picturesQuantity: String?
    var rightImage: rightImageName
}
