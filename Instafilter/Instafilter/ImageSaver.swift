//
//  ImageSaver.swift
//  Instafilter
//
//  Created by 이태현 on 2022/04/24.
//

import UIKit

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFiinishedSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("save finished!")
    }
    
}
