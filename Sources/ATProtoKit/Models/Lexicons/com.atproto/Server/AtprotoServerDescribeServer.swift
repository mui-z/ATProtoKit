//
//  AtprotoServerDescribeServer.swift
//
//
//  Created by Christopher Jr Riley on 2024-02-25.
//

import Foundation

/// A data model definition for the output of retrieving a description of the server.
///
/// - Note: According to the AT Protocol specifications: "Describes the server's account creation requirements and capabilities. Implemented by PDS."
///
/// - SeeAlso: This is based on the [`com.atproto.server.describeServer`][github] lexicon.
///
/// [github]: https://github.com/bluesky-social/atproto/blob/main/lexicons/com/atproto/server/describeServer.json
public struct ServerDescribeServerOutput: Codable {
    /// Indicates whether an invite code is required to join the server. Optional.
    ///
    /// - Note: According to the AT Protocol specifications: "If true, an invite code must be supplied to create an account on this instance."
    public let isInviteCodeRequired: Bool?
    /// Indicates whether the user is required to verify using a phone number. Optional.
    ///
    /// - Note: According to the AT Protocol specifications: "If true, a phone verification token must be supplied to create an account on this instance."
    public let isPhoneVerificationRequired: Bool?
    /// An array of available user domains.
    ///
    /// - Note: According to the AT Protocol specifications: "List of domain suffixes that can be used in account handles."
    public let availableUserDomains: [String]
    /// A group of URLs for the server's service policies. Optional.
    ///
    /// - Note: According to the AT Protocol specifications: "URLs of service policy documents."
    public let servicePolicyURLs: ServicePolicyURLs
    /// The decentralized identifier (DID) of the server.
    public let serverDID: String

    enum CodingKeys: String, CodingKey {
        case isInviteCodeRequired = "inviteCodeRequired"
        case isPhoneVerificationRequired = "phoneVerificationRequired"
        case availableUserDomains
        case servicePolicyURLs = "links"
        case serverDID = "did"
    }
}

/// A data model definition of service policy URLs.
///
/// - Note: According to the AT Protocol specifications: "Describes the server's account creation requirements and capabilities. Implemented by PDS."
///
/// - SeeAlso: This is based on the [`com.atproto.server.describeServer`][github] lexicon.
///
/// [github]: https://github.com/bluesky-social/atproto/blob/main/lexicons/com/atproto/server/describeServer.json
public struct ServicePolicyURLs: Codable {
    /// The URL for the server's Privacy Policy. Optional.
    public let privacyPolicyURL: URL?
    /// The URL for the server's Terms of Service. Optional.
    public let termsOfServiceURL: URL?

    enum CodingKeys: String, CodingKey {
        case privacyPolicyURL = "privacyPolicy"
        case termsOfServiceURL = "termsOfService"
    }
}
