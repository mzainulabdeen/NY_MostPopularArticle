//
//  NYActivity.swift
//  NY_MostPopularArticle
//
//  Created by Muhammad Zain ul Abdeen on 31/01/2022.
//

import Foundation
import SVProgressHUD

public class NYActivity {
    private init() {
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
    }
    public static func showActivityIndicator() {
        SVProgressHUD.show()
    }
    
    public static func hideActivityIndicator() {
        SVProgressHUD.dismiss()
    }
}
