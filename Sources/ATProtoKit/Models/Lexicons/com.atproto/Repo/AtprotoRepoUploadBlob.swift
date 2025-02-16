//
//  AtprotoRepoUploadBlob.swift
//
//
//  Created by Christopher Jr Riley on 2024-02-05.
//

import Foundation

// MARK: - Main definition
/// The main data model definition for the image's query..
public struct ImageQuery: Encodable {
    /// The data of the image.
    public let imageData: Data
    /// The file name of the image.
    public let fileName: String
    /// The alt text of the image,
    public let altText: String?

    public init(imageData: Data, fileName: String, altText: String?) {
        self.imageData = imageData
        self.fileName = fileName
        self.altText = altText
    }
}

// MARK: -
// TODO: Find a way to remove BlobContainer without breaking the JSON encoding.
// This will be here until a way to remove this without the issues of
// the JSON encoding are solved.
/// The container used for storing blobs within a record.
///
/// - Note: This is a temporary measure and will be deleted once a better solution is made.
public struct BlobContainer: Codable {
    /// The blob itself.
    public let blob: UploadBlobOutput
}

/// A data model for a definition of an output of uploading a blob..
public struct UploadBlobOutput: Codable {
    /// The type of blob.
    public let type: String?
    /// The strong reference of the blob.
    public let reference: BlobReference
    /// The the MIME type.
    ///
    /// This can be a `.jpg`, `.png`, and `.gif`
    public let mimeType: String
    /// The size of the blob.
    public let size: Int

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case reference = "ref"
        case mimeType
        case size
    }
}

/// A data model for a blob reference definition.
public struct BlobReference: Codable {
    /// The link of the blob reference.
    public let link: String

    enum CodingKeys: String, CodingKey {
        case link = "$link"
    }
}
