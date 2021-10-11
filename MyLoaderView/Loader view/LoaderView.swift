//
//  LoaderView.swift
//  MyLoaderView
//
//  Created by Mostafa Ayman on 12/10/2021.
//

import UIKit

class LoaderView: UIView {

    class func instanceFromNib() -> LoaderView{
        return UINib(nibName: "LoaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! LoaderView
    }

}
