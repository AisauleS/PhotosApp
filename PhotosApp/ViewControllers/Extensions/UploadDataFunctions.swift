//
//  UploadDataFunctions.swift
//  PhotosApp
//
//  Created by Aisaule Sibatova on 16.03.2023.
//

import UIKit

extension AlbumViewController {
    
    // MARK: - Upload data functions
    
    func uploadMyAlbumsData() {
        myAlbums.append(AlbumFolders(image: UIImage(named: "book1"), folderName: "Recents", picturesQuantity: "4628"))
        myAlbums.append(AlbumFolders(image: UIImage(named: "pic3"), folderName: "Favorites", picturesQuantity: "498"))
        myAlbums.append(AlbumFolders(image: UIImage(named: "pic4"), folderName: "Saved", picturesQuantity: "548"))
        myAlbums.append(AlbumFolders(image: UIImage(named: "pic5"), folderName: "WhatsApp", picturesQuantity: "49"))
        myAlbums.append(AlbumFolders(image: UIImage(named: "pic6"), folderName: "Instagram", picturesQuantity: "325"))
        myAlbums.append(AlbumFolders(image: UIImage(named: "pic7"), folderName: "Capcut", picturesQuantity: "448"))
    }
    
    func uploadSharedAlbumsData() {
        sharedAlbums.append(AlbumFolders(image: UIImage(named: "pic8"), folderName: "Family", picturesQuantity: "798"))
        sharedAlbums.append(AlbumFolders(image: UIImage(named: "pic9"), folderName: "Vacation", picturesQuantity: "1498"))
    }
    
    func uploadMediaTypesData() {
        mediaTypes.append(AlbumList(image: UIImage(systemName: "video"), folderName: "Videos", picturesQuantity: "54", rightImage: .chevron))
        mediaTypes.append(AlbumList(image: UIImage(systemName: "person.crop.square"), folderName: "Selfies", picturesQuantity: "57", rightImage: .chevron))
        mediaTypes.append(AlbumList(image: UIImage(systemName: "livephoto"), folderName: "Live Photos", picturesQuantity: "324", rightImage: .chevron))
        mediaTypes.append(AlbumList(image: UIImage(systemName: "cube"), folderName: "Portrait", picturesQuantity: "67", rightImage: .chevron))
        mediaTypes.append(AlbumList(image: UIImage(systemName: "timelapse"), folderName: "Time-lapse", picturesQuantity: "13", rightImage: .chevron))
        mediaTypes.append(AlbumList(image: UIImage(systemName: "slowmo"), folderName: "Slo-mo", picturesQuantity: "12", rightImage: .chevron))
        mediaTypes.append(AlbumList(image: UIImage(systemName: "square.stack.3d.down.right"), folderName: "Bursts", picturesQuantity: "50", rightImage: .chevron))
        mediaTypes.append(AlbumList(image: UIImage(systemName: "camera.viewfinder"), folderName: "Screenshots", picturesQuantity: "675", rightImage: .chevron))
        mediaTypes.append(AlbumList(image: UIImage(systemName: "record.circle"), folderName: "Screen Recordings", picturesQuantity: "45", rightImage: .chevron))
    }
    
    func uploadUtilitiesData(){
        utilities.append(AlbumList(image: UIImage(systemName: "square.and.arrow.down"), folderName: "Imports", picturesQuantity: "265", rightImage: .chevron))
        utilities.append(AlbumList(image: UIImage(systemName: "square.and.arrow.down"), folderName: "Duplicates", picturesQuantity: "56", rightImage: .chevron))
        utilities.append(AlbumList(image: UIImage(systemName: "eye.slash"), folderName: "Hidden", rightImage: .lock))
        utilities.append(AlbumList(image: UIImage(systemName: "trash"), folderName: "Recently Deleted", rightImage: .lock))
    }
}
