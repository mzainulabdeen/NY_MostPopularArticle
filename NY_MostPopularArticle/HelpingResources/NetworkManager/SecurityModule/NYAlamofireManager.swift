//
//  NYAlamofireManager.swift
//  NY_MostPopularArticle
//
//  Created by Muhammad Zain ul Abdeen on 31/01/2022.
//

import Alamofire

public struct NYAlamofireManager {
    
    public static let shared: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 1000
        
        // SSL Pinning Technique introduce to metigate the Man in Middle Attacks
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "api.nytimes.com": .pinCertificates(
                certificates: Certificates.apiNYTimes,
                validateCertificateChain: true,
                validateHost: true
            )
        ]
        let sessionManager = Alamofire.SessionManager(configuration: configuration, delegate: SessionDelegate(), serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
        return sessionManager
    }()
}

struct Certificates {
  static let apiNYTimes = Certificates.certificate(filename: "api.nytimes.com")
  private static func certificate(filename: String) -> [SecCertificate] {
    var certificates: [SecCertificate] = []
    let filePath =  Bundle.main.url(forResource: filename, withExtension: "cer")!
    let data = try! Data(contentsOf: filePath)
    let certificate = SecCertificateCreateWithData(nil, data as CFData)!
    certificates.append(certificate)
    return certificates
  }
}


