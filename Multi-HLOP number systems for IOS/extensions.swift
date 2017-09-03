//
//  extensions.swift
//  Multi-HLOP number systems for IOS
//
//  Created by Эльдар Дамиров on 03.05.17.
//  Copyright © 2017 Эльдар Дамиров. All rights reserved.
//

import Foundation


extension UIViewController
    {
    func hideKeyboardWhenTappedAround()
        {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer ( target: self, action: #selector ( UIViewController.dismissKeyboard ) )
        tap.cancelsTouchesInView = false            
        view.addGestureRecognizer ( tap )
        }

    func dismissKeyboard()
        {
        view.endEditing ( true )
        }
    }
