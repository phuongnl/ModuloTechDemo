//
//  ViewExt.swift
//  
//
//  Created by Lucas Lee on 15/06/2021.
//  Copyright © 2018 Lucas Lee. All rights reserved.
//

import UIKit

extension UIView: ReusableView {}

extension UIView {
    
    class func instantiateFromNib<T: UIView>() -> T {
        guard let view = UINib(nibName: T.nibName, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? T else {
            return T()
        }
        return view
    }
    
}
