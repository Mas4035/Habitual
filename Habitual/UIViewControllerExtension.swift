//
//  UIViewContriller.swift
//  Habitual
//
//  Created by Student Guest on 3/20/23.
//

import UIKit

extension UIViewController {
  static func instantiate() -> Self {
    return self.init(nibName: String(describing: self), bundle: nil)
  }
}
