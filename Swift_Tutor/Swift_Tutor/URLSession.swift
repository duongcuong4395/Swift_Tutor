//
//  URLSession.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/22/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

// MARK: SOURCE: https://www.userdesk.io/blog/protocol-oriented-networking-using-url-session-with-swift/
/*
 URLSession is responsible for creating URLSessionTaks for us, we don't create them ourselves. We are responsible for passing a URL or URLRequest to the specialized instance methods that URLSession provides to be able to create a task instance. Once created, the caller is responsible for calling resume() on the task instance to start the actual request.
 */

import UIKit

/// Protocol to which network session handling classes must conform to.
protocol NetworkSessionProtocol {
    /// Create  a URLSessionDataTask. The caller is responsible for calling resume().
    /// - Parameters:
    ///   - request: `URLRequest` object.
    ///   - completionHandler: The completion handler for the data task.
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask?

    /// Create  a URLSessionDownloadTask. The caller is responsible for calling resume().
    /// - Parameters:
    ///   - request: `URLRequest` object.
    ///   - progressHandler: Optional `ProgressHandler` callback.
    ///   - completionHandler: The completion handler for the download task.
    func downloadTask(request: URLRequest, progressHandler: ProgressHandler?, completionHandler: @escaping (URL?, URLResponse?, Error?) -> Void) -> URLSessionDownloadTask?

    /// Create  a URLSessionUploadTask. The caller is responsible for calling resume().
    /// - Parameters:
    ///   - request: `URLRequest` object.
    ///   - fileURL: The source file `URL`.
    ///   - progressHandler: Optional `ProgressHandler` callback.
    ///   - completion: he completion handler for the upload task.
    func uploadTask(with request: URLRequest, from fileURL: URL, progressHandler: ProgressHandler?, completion: @escaping (Data?, URLResponse?, Error?)-> Void) -> URLSessionUploadTask?
}


/*
 This class/struct conforming to this protocol will have three methods that are responsible for creating URLSessionDataTask, URLSessionDownloadTask and URLSessionUploadTask instances.
 */


class APINetworkSession: NSObject {

    /// The URLSession handing the URLSessionTaks.
    var session: URLSession!

    /// A typealias describing a progress and completion handle tuple.
    private typealias ProgressAndCompletionHandlers = (progress: ProgressHandler?, completion: ((URL?, URLResponse?, Error?) -> Void)?)

    /// Dictionary containing associations of `ProgressAndCompletionHandlers` to `URLSessionTask` instances.
    private var taskToHandlersMap: [URLSessionTask : ProgressAndCompletionHandlers] = [:]

    /// Convenience initializer.
    public override convenience init() {
        // Configure the default URLSessionConfiguration.
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForResource = 30
        if #available(iOS 11, *) {
            sessionConfiguration.waitsForConnectivity = true
        }

        // Create a `OperationQueue` instance for scheduling the delegate calls and completion handlers.
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 3
        queue.qualityOfService = .userInitiated

        // Call the designated initializer
        self.init(configuration: sessionConfiguration, delegateQueue: queue)
    }

    /// Designated initializer.
    /// - Parameters:
    ///   - configuration: `URLSessionConfiguration` instance.
    ///   - delegateQueue: `OperationQueue` instance for scheduling the delegate calls and completion handlers.
    public init(configuration: URLSessionConfiguration, delegateQueue: OperationQueue) {
        super.init()
        self.session = URLSession(configuration: configuration, delegate: (self as URLSessionDelegate), delegateQueue: delegateQueue)
    }


    /// Associates a `URLSessionTask` instance with its `ProgressAndCompletionHandlers`
    /// - Parameters:
    ///   - handlers: `ProgressAndCompletionHandlers` tuple.
    ///   - task: `URLSessionTask` instance.
    private func set(handlers: ProgressAndCompletionHandlers?, for task: URLSessionTask) {
        taskToHandlersMap[task] = handlers
    }

    /// Fetches the `ProgressAndCompletionHandlers` for a given `URLSessionTask`.
    /// - Parameter task: `URLSessionTask` instance.
    /// - Returns: `ProgressAndCompletionHandlers` optional instance.
    private func getHandlers(for task: URLSessionTask) -> ProgressAndCompletionHandlers? {
        return taskToHandlersMap[task]
    }

    deinit {
        // We have to invalidate the session becasue URLSession strongly retains its delegate. https://developer.apple.com/documentation/foundation/urlsession/1411538-invalidateandcancel
        session.invalidateAndCancel()
        session = nil
    }
}

/*
 Why did we pass a URLSessionConfiguration to the designated initializer?
 We want to write code that is flexible, has a single, well-defined purpose and is easy to test. To achieve this, we will need a URLSessionConfiguration when initializing our URLSession instance.


 By doing this we can take advantage or iOS ephemeral configuration when testing against a mock server for example or to create a session that can easily handle background requests through:

 URLSessionConfiguration.background(withIdentifier: "id.download.background-job")
 */

/*
 Why did we need a (URLSessionTaks, ProgressAndCompletionHandlers) tuple?
 This could have been easily left out if we just passed completion handlers to the URLSessionTaks but because we want to sprinkle a progress handler for our upload and download tasks while being able to handle multiple downloads and upload tasks in the process, we will need to implement a couple of methods to conform with URLSessionDelegate and URLSessionDownloadDelegate.


 One thing that was pointed out to me on reddit by a user, (thanks again, mate!) is that URLSession retains its delegate, so you have to call invalidateAndCancel before setting the session to nil. Once a session is invalidated, you can no longer use it. This is probably the only situation where Cocoa breaks the "a delegate should always be weak" rule and I wasn't aware of it. This comes to prove that there's always something new to learn.
 */


// we will split each protocol implementation into an extension making it easier to separate our logic and improve readability.

extension APINetworkSession: NetworkSessionProtocol {

    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask? {
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            completionHandler(data, response, error)
        }
        return dataTask
    }

    func downloadTask(request: URLRequest, progressHandler: ProgressHandler? = nil, completionHandler: @escaping (URL?, URLResponse?, Error?) -> Void) -> URLSessionDownloadTask? {
        let downloadTask = session.downloadTask(with: request)
        // Set the associated progress and completion handlers for this task.
        set(handlers: (progressHandler, completionHandler), for: downloadTask)
        return downloadTask
    }

    func uploadTask(with request: URLRequest, from fileURL: URL, progressHandler: ProgressHandler? = nil, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionUploadTask? {
        let uploadTask = session.uploadTask(with: request, fromFile: fileURL, completionHandler: { (data, urlResponse, error) in
            completion(data, urlResponse, error)
        })
        // Set the associated progress handler for this task.
        set(handlers: (progressHandler, nil), for: uploadTask)
        return uploadTask
    }
}


extension APINetworkSession: URLSessionDelegate {

    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        guard let handlers = getHandlers(for: task) else {
            return
        }

        let progress = Float(totalBytesSent) / Float(totalBytesExpectedToSend)
        DispatchQueue.main.async {
            handlers.progress?(progress)
        }
        //  Remove the associated handlers.
        set(handlers: nil, for: task)
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        guard let downloadTask = task as? URLSessionDownloadTask,
            let handlers = getHandlers(for: downloadTask) else {
            return
        }

        DispatchQueue.main.async {
            handlers.completion?(nil, downloadTask.response, downloadTask.error)
        }

        //  Remove the associated handlers.
        set(handlers: nil, for: task)
    }
}


extension APINetworkSession: URLSessionDownloadDelegate {

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let handlers = getHandlers(for: downloadTask) else {
            return
        }

        DispatchQueue.main.async {
            handlers.completion?(location, downloadTask.response, downloadTask.error)
        }

        //  Remove the associated handlers.
        set(handlers: nil, for: downloadTask)
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        guard let handlers = getHandlers(for: downloadTask) else {
            return
        }

        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        DispatchQueue.main.async {
            handlers.progress?(progress)
        }
    }
}
