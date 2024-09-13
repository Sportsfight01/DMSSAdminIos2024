//
//  DashboardCVC.swift
//  DMSSAdmin
//
//  Created by Naveen Kourampalli on 02/09/24.
//

import UIKit

class DashboardCVC: UICollectionViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var categoryLBL: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "DashboardCVC"
    static let nib = UINib(nibName: "DashboardCVC", bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        // Initialization code
    }
    
    func setup(){
        baseView.dropShadow(color: .gray, offSet: CGSize(width: 1, height: 1),radius: 5,scale: true, cornerRadius: 5)
       // baseView.appalyShadow(cornerRadius: 5, shadowOpacity: 1, shadowradius: 10)
        
    }

    
    
}

