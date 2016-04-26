//
//  UIViewController+KeyboardHacks.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray, Weston E Jones on 4/24/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    // Function to remove keyboard from screen when user is done typing.
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    // secondary function to remove keyboard from screen when user is done typing for table views.
    func dismissKeyboard() {
        view.endEditing(true)
    }
}