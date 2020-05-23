//
//  Utility.swift
//  FirebaseDemo
//
//  Created by ganesh padole on 23/05/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import Foundation
import UIKit

class Utility: NSObject {
    
    class func invokeAlertMethod(_ strTitle: String, strBody: String, delegate: Any?) {
      
      let alert = UIAlertController(title: strTitle, message: strBody, preferredStyle: UIAlertController.Style.alert)
      alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController?.present(alert, animated: true, completion: nil)
     
    }
    
}
