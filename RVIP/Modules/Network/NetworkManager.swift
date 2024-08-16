//
//  API.swift
//  RVIP
//
//  Created by Александр Иванов on 31.07.2024.
//

import Foundation

class NetworkManager {
    var networkClient: AsyncHttpClient?
    
    var onProgressChange: ((Double) -> ())?
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "Authorization": "token"
        ]
        networkClient = AsyncHttpJsonClient(configuration: configuration)
    }
}

//extension NetworkManager: URLSessionDownloadDelegate {
//    func urlSession(
//        _ session: URLSession,
//        downloadTask: URLSessionDownloadTask,
//        didWriteData bytesWritten: Int64,
//        totalBytesWritten: Int64,
//        totalBytesExpectedToWrite: Int64
//    ) {
//        let progress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
//        onProgressChange?(progress)
//    }
//}
