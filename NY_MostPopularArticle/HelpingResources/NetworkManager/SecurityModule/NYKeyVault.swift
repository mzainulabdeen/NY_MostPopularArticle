//
//  NYKeyVault.swift
//  NY_MostPopularArticle
//
//  Created by Muhammad Zain ul Abdeen on 31/01/2022.
//

import Foundation

public enum NYKeyVault: String {
   
    case apiKey
        
    public var value: String {
        var value : [UInt8] = []
        switch self {
        case .apiKey:
            value = [208, 87, 15, 74, 36, 128, 210, 141, 118, 200, 81, 63, 98, 148, 14, 17, 137, 136, 207, 243, 0, 155, 145, 248, 229, 248, 207, 4, 16, 147, 255, 111, 164, 98, 117, 4, 97, 177, 234, 227, 28, 251, 52, 88, 83, 215, 125, 90, 219, 229, 247, 164, 69, 233, 255, 162, 136, 171, 165, 48, 117, 245, 152, 60]
        }
        return String(bytes: value.deobfuscated, encoding: .utf8)!
    }
}

