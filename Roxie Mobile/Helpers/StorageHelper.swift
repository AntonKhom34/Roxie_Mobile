//
//  StorageHelper.swift
//  Roxie Mobile
//
//  Created by Антон Хомяков on 07.03.2020.
//  Copyright © 2020 Антон Хомяков. All rights reserved.
//

import Foundation

class StorageHelper {
    
    // MARK: - Public

    static func download(url: String, onComplete: @escaping () -> Void) {
        guard let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Could not get FileManager")
        }
        URLSession.shared.downloadTask(with: getCurrentURLString(photoName: url)) { localURL, urlResponse, error in
            guard let localURL = localURL else {
                return
            }
            let destinationURL = documentsDirectoryURL.appendingPathComponent(urlResponse?.suggestedFilename ?? self.getCurrentURLString(photoName: url).lastPathComponent)
            do {
                try FileManager.default.moveItem(at: localURL, to: destinationURL)
                onComplete()
            } catch {
                onComplete()
            }
        }.resume()
    }

    static func removeFromStorage(photo: String) {
        guard let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: documentsDirectoryURL,
                                                                       includingPropertiesForKeys: nil,
                                                                       options: [.skipsHiddenFiles, .skipsSubdirectoryDescendants])
            for fileURL in fileURLs {
                if fileURL.absoluteString == StorageHelper.getSaveFileUrl(fileName: photo) {
                    try FileManager.default.removeItem(at: fileURL)
                }
            }
        } catch {
            return
        }
    }
    
    static func getSaveFileUrl(fileName: String) -> String {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        guard let nameUrl = URL(string: fileName) else {
            return ""
        }
        let fileURL = documentsURL.appendingPathComponent((nameUrl.lastPathComponent))
        return fileURL.path
    }
    
    // MARK: - Private
    
    static private func getCurrentURLString(photoName: String) -> URL {
        let urlString = ServiceManager.api + "images/" + photoName
        guard let url = URL(string: urlString) else {
            fatalError("Could not get url")
        }
        return url
    }

}
