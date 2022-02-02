//
//  NYMessages.swift
//  NY_MostPopularArticle
//
//  Created by Muhammad Zain ul Abdeen on 31/01/2022.
//

import UIKit
import SwiftMessages

class NYMessages: SwiftMessages {

    public static func showMessage(message: String, theme: Theme, duration: Duration = .automatic) {
    
        var config: SwiftMessages.Config = SwiftMessages.defaultConfig
        config.duration = duration
        SwiftMessages.show(config: config) { () -> UIView in
            
            let view = MessageView.viewFromNib(layout: .cardView)
            view.button?.isHidden = true
            view.configureTheme(theme)
            view.configureDropShadow()
            var title = "Error"
            switch theme {
            case .success:
                title  = "Success"
            case .info:
                title  = "Info"
            case .warning:
                title  = "Warning"
            default:
                break
            }
            view.configureContent(title: title, body: message)
            
            return view

        }
    }

}


