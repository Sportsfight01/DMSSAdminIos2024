//
//  TaskListTVC.swift
//  DMSSAdmin
//
//  Created by Naveen Kourampalli on 04/09/24.
//

import UIKit

class TaskListTVC: UITableViewCell {

    @IBOutlet weak var checkMarkBTN: UIButton!
    @IBOutlet weak var areaNameLBL: UILabel!
    @IBOutlet weak var taskNameLBL: UILabel!
    @IBOutlet weak var dateLBL: UILabel!
    @IBOutlet weak var statusLBL: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    var buttonTapAction: (() -> Void)?
    var isChecked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(data : pantryData){
        taskNameLBL.text = data.subname
        areaNameLBL.text = data.area
        dateLBL.text = data.date.formatted(date: .numeric, time: .shortened)
        statusLBL.text = data.status
        isChecked.toggle()
        if data.status == "pending" || data.status == "pending"{
            isChecked = true
            checkMarkBTN.setImage(UIImage(systemName:"checkmark.square.fill"), for: .normal)
        }else{
            isChecked = false
            checkMarkBTN.setImage(UIImage(systemName:"square"), for: .normal)

        }
    }
    @IBAction func didTappedOnSelectBTN(_ sender: UIButton) {
        buttonTapAction?()
        isChecked.toggle()
//               if isChecked {
//                   // Set to checked state
//                   sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
//               } else {
//                   // Set to unchecked state
//                   sender.setImage(UIImage(systemName:"square"), for: .normal)
//               }
    }
    
}
