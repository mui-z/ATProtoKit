//
//  ATProtoError.swift
//
//
//  Created by Christopher Jr Riley on 2024-01-06.
//

import Foundation

/// The base exception class for ATProtoKit.
public enum ATProtoError: Error, Decodable {
    /// Represents a bad request error (HTTP 400) with an associated message.
    /// - Parameter message: The message received along side the error.
    case badRequest(message: String) // Error 400
    /// Represents an unauthorized error (HTTP 401) with an associated message.
    /// - Parameter message: The message received along side the error.
    case unauthorized(message: String)
    /// Represents a forbidden error (HTTP 403) with an associated message.
    /// - Parameter message: The message received along side the error.
    case forbidden(message: String)
    /// Represents a payload too large error (HTTP 413) with an associated message.
    /// - Parameter message: The message received along side the error.
    case payloadTooLarge(message: String)
    /// Represents a too many requests error (HTTP 429) with an associated message.
    /// - Parameter message: The message received along side the error.
    case tooManyRequests(message: String)
    /// Represents an internal server error (HTTP 500) with an associated message.
    /// - Parameter message: The message received along side the error.
    case internalServerError(message: String)
    /// Represents a method not implemented error (HTTP 501) with an associated message.
    /// - Parameter message: The message received along side the error.
    case methodNotImplemented(message: String)
    /// Represents a bad gateway error (HTTP 502) with an associated message.
    /// - Parameter message: The message received along side the error.
    case badGateway(message: String)
    /// Represents a service unavailable error (HTTP 503) with an associated message.
    /// - Parameter message: The message received along side the error.
    case serviceUnavailable(message: String)
    /// Represents a gateway timeout error (HTTP 504) with an associated message.
    /// - Parameter message: The message received along side the error.
    case gatewayTimeout(message: String)
    /// Represents an unknown error with an associated message.
    /// - Parameter message: The message received along side the error.
    case unknown(message: String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let errorType = try container.decode(String.self, forKey: .error)
        let message = try container.decode(String.self, forKey: .message)

        switch errorType {
            case 
                "InvalidRequest",
                "ExpiredToken",
                "InvalidToken",
                "BlockedActor",
                "BlockedByActor",
                "UnknownFeed",
                "UnknownList",
                "NotFound",
                "BadQueryString",
                "SubjectHasAction",
                "RecordNotFound",
                "RepoNotFound",
                "InvalidSwap",
                "AccountNotFound",
                "InvalidEmail",
                "InvalidHandle",
                "InvalidPassword",
                "InvalidInviteCode",
                "HandleNotAvailable",
                "UnsupportedDomain",
                "UnresolvableDid",
                "IncompatibleDidDoc",
                "AccountTakedown",
                "DuplicateCreate",
                "TokenRequired":
                self = .badRequest(message: message)
            case "Unauthorized":
                self = .unknown(message: message)
            case "Forbidden":
                self = .forbidden(message: message)
            case "PayloadTooLarge":
                self = .payloadTooLarge(message: message)
            case "TooManyRequests":
                self = .tooManyRequests(message: message)
            case "InternalServerError":
                self = .internalServerError(message: message)
            case "MethodNotImplemented":
                self = .methodNotImplemented(message: message)
            case "BadGateway":
                self = .badGateway(message: message)
            case "ServiceUnavailable":
                self = .serviceUnavailable(message: message)
            case "GatewayTimeout":
                self = .gatewayTimeout(message: message)
            default:
                self = .unknown(message: message)
        }
    }

    enum CodingKeys: String, CodingKey {
        case error
        case message
    }
}
