//
//  UIAlertController+Extension.swift
//  Locations
//
//  Created by Jibin Raju on 30/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    class func alertWithOKButton(message: String, okActionCallBack: ((UIAlertAction) -> Swift.Void)? = nil) -> UIAlertController {
        let title = NSLocalizedString("App_Name", comment: "Alert viewcontroller title")
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButtonTitle = NSLocalizedString("OK", comment: "OK buttone title")
        let OKAction = UIAlertAction(title: okButtonTitle, style: .default, handler: okActionCallBack)
        alertController.addAction(OKAction)
        
        return alertController
    }
}

