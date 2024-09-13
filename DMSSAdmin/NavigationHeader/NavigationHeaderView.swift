//
//  NavigationHeaderView.swift
//  DMSSAdmin
//
//  Created by Naveen Kourampalli on 03/09/24.
//

import UIKit

class NavigationHeaderView: UIView {

    @IBOutlet weak var menuBTN: UIButton!
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var baseView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func commonInit()
    {
        Bundle.main.loadNibNamed("NavigationHeaderView", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,
            .flexibleHeight]
        
        
       
    }

}
