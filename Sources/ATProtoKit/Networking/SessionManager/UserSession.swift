//
//  UserSession.swift
//  
//
//  Created by Christopher Jr Riley on 2024-01-05.
//

import Foundation

/// Represents an authenticated user session within the AT Protocol.
///
/// This class encapsulates the details of a user's session, including their decentralized identifier (DID),
/// authentication tokens, and optional user information such as email. It also references the user's
/// DID document, which contains crucial AT Protocol-specific information.
public class UserSession: SessionProtocol {
    /// The user's handle within the AT Protocol.
    public private(set) var handle: String
    /// The decentralized identifier (DID), serving as a persistent and long-term account identifier according to the W3C standard.
    public private(set) var sessionDID: String
    /// The user's email address. Optional.
    public private(set) var email: String?
    /// Indicates whether the user's email address has been confirmed. Optional.
    public private(set) var isEmailConfirmed: Bool?
    /// The access token used for API requests that requests authentication.
    public private(set) var accessToken: String
    /// The refresh token used to generate a new access token.
    public private(set) var refreshToken: String
    /// The DID document associated with the user, which contains AT Protocol-specific information. Optional.
    public private(set) var didDocument: DIDDocument?
    
    /// The URL of the Personal Data Server (PDS) associated with the user. Optional.
    /// - Note: This is not included when initalizing `UserSession`. Instead, it's added after the successful initalizing.
    public var pdsURL: String?
    
    /// Initializes a new user session with the specified details.
    public init(handle: String, sessionDID: String, email: String? = nil, isEmailConfirmed: Bool? = nil, accessToken: String, refreshToken: String, didDocument: DIDDocument? = nil, pdsURL: String? = nil) {
        self.handle = handle
        self.sessionDID = sessionDID
        self.email = email
        self.isEmailConfirmed = isEmailConfirmed
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.didDocument = didDocument
        self.pdsURL = pdsURL
    }

    enum CodingKeys: String, CodingKey {
        case handle
        case sessionDID = "did"
        case email
        case isEmailConfirmed = "emailConfirmed"
        case accessToken = "accessJwt"
        case refreshToken = "refreshJwt"
        case didDocument = "didDoc"
        case pdsURL
    }

    /// Checks whether the current access token is expired.
    /// - Returns: A Boolean value indicating if the access token is expired.
    public func isAccessTokenExpired() -> Bool {
        // Implement logic to check if the accessToken is expired
        // This could involve decoding the JWT and checking its expiry timestamp
        return false
    }
}


/// Represents a DID document in the AT Protocol, containing crucial information for AT Protocol functionality.
///
/// The DID document includes the decentralized identifier (DID), verification methods, and service endpoints necessary for interacting
/// with the AT Protocol ecosystem, such as authentication and data storage locations.
public struct DIDDocument: Codable {
    /// An array of context URLs for the DID document, providing additional semantics for the properties.
    public var context: [String]
    /// The unique identifier of the DID document.
    public var id: String
    /// An array of URIs under which this DID is also known, including the primary handle URI. Optional.
    public var alsoKnownAs: [String]?
    /// An array of methods for verifying digital signatures, including the public signing key for the account.
    public var verificationMethod: [VerificationMethod]
    /// An array of service endpoints related to the DID, including the PDS location.
    public var service: [Service]

    enum CodingKeys: String, CodingKey {
        case context = "@context"
        case id
        case alsoKnownAs
        case verificationMethod
        case service
    }
}

/// Describes a method for verifying digital signatures in the AT Protocol, including the public signing key.
public struct VerificationMethod: Codable {
    /// The unique identifier of the verification method.
    public var id: String
    /// The type of verification method that indicates the cryptographic curve used.
    public var type: String
    /// The controller of the verification method, which matches the DID.
    public var controller: String
    /// The public key, in multibase encoding; used for verifying digital signatures.
    public var publicKeyMultibase: String
}

/// Represents a service endpoint in a DID document, such as the PDS location for the AT Protocol.
public struct Service: Codable {
    /// The unique identifier of the service.
    public var id: String
    /// The type of service (matching `AtprotoPersonalDataServer`) for use in identifying the Personal Data Server (PDS).
    public var type: String
    /// The endpoint URL for the service, specifying the location of the service.
    public var serviceEndpoint: URL
}
