//
//  PantryVC.swift
//  DMSSAdmin
//
//  Created by Naveen Kourampalli on 03/09/24.
//

import UIKit

class PantryVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var openLBL: UIButton!
    @IBOutlet weak var pendingLBL: UIButton!
    @IBOutlet weak var completedLBL: UIButton!
    @IBOutlet weak var openBTN: UIButton!
    @IBOutlet weak var pendingBTN: UIButton!
    @IBOutlet weak var submitBTN: UIButton!
    @IBOutlet weak var calenderBTN: UIButton!
    @IBOutlet weak var completedBTN: UIButton!
    @IBOutlet weak var dateLBL: UILabel!
    @IBOutlet weak var allBTN: UIButton!
    var pantryDataArr = [pantryData]()
    var vm : pantryDataViewModel!
    var selectedDataArr = [pantryData]()
    var isSelectedStatus = ""
    var pantryImg = ""
    var isTappedOn = 1
    
    let datePickerView: MyDatePicker = {
            let v = MyDatePicker()
            return v
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStatusBarColor()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = "Pantry"
        self.tableView.register(UINib(nibName: "TaskListTVC", bundle: nil), forCellReuseIdentifier: "TaskListTVC")
        pantryDataArr = pantryArr
        self.selectedDataArr = pantryDataArr
        tableView.reloadData()
        
        datePickerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePickerView)
        let constr = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            // custom picker view should cover the whole view
            datePickerView.topAnchor.constraint(equalTo: constr.topAnchor),
            datePickerView.leadingAnchor.constraint(equalTo: constr.leadingAnchor),
            datePickerView.trailingAnchor.constraint(equalTo: constr.trailingAnchor),
            datePickerView.bottomAnchor.constraint(equalTo: constr.bottomAnchor)
        ])
        datePickerView.isHidden = true
        
        // add closures to custom picker view
        datePickerView.dismissClosure = { [weak self] in
            guard let self = self else {
                return
            }
            self.datePickerView.isHidden = true
        }
        datePickerView.changeClosure = { [weak self] val in
            guard let self = self else {
                return
            }
            print(val.formatted(date: .numeric, time: .omitted))
            self.dateLBL.text = "\(val.formatted(date: .numeric, time: .omitted))"
        }
    }
    
   
    
    @IBAction func didTappedOnAll(_ sender: UIButton) {
        sender.tintColor = APPCOLORS.App_Color
        
        if self.isTappedOn == 1{
            for i in self.pantryDataArr.indices{
                pantryDataArr[i].status = "pending"
            }
            sender.setImage(UIImage(named: "checkmark.square.fill"), for: .normal)
            isTappedOn = 0
        }else{
            sender.setImage(UIImage(named: "square"), for: .normal)
        }
        
        if self.isTappedOn == 2 {
            for i in self.pantryDataArr.indices{
                pantryDataArr[i].status = "completed"
            }
            sender.setImage(UIImage(named: "checkmark.square.fill"), for: .normal)

        }else{
            sender.setImage(UIImage(named: "square"), for: .normal)
        }
        self.tableView.reloadData()
        print("all")
    }
    @IBAction func didTappedOnCalender(_ sender: Any) {
        print("calender")
        datePickerView.isHidden = false
        
    }
    
    @IBAction func didTappedOnSubmit(_ sender: Any) {
        print("submit")
       
    }
    
    @IBAction func didTappedOnOpen(_ sender: Any) {
        isSelectedStatus = ""
        isTappedOn = 1
        self.pantryDataArr = self.selectedDataArr.filter({$0.status == isSelectedStatus})
        tableView.reloadData()
        print("Open")
        
    }
    
    @IBAction func didTappedOnPending(_ sender: Any) {
        isSelectedStatus = "Pending"
        isTappedOn = 2
       self.pantryDataArr = self.selectedDataArr.filter({$0.status == isSelectedStatus})
        tableView.reloadData()
        print("Pending")
    }

    @IBAction func didTappedOnCOmpleted(_ sender: Any) {
        isSelectedStatus = "completed"
        isTappedOn = 3
        self.pantryDataArr = self.selectedDataArr.filter({$0.status == isSelectedStatus})
        tableView.reloadData()
        print("completed")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PantryVC{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pantryDataArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListTVC", for: indexPath) as! TaskListTVC
        cell.categoryImage.image = UIImage(named: "Pantry")
        cell.setupData(data: pantryDataArr[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let cell = tableView.cellForRow(at: indexPath) as! TaskListTVC
        cell.isChecked.toggle()
        if cell.isChecked {
            // Set to checked state
            cell.checkMarkBTN.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            if self.isSelectedStatus == ""{
                self.selectedDataArr[indexPath.row].status = "Pending"
            }else if self.isSelectedStatus == "Pending"{
                self.selectedDataArr[indexPath.row].status = "completed"
            }
        } else {
            // Set to unchecked state
            cell.checkMarkBTN.setImage(UIImage(systemName:"square"), for: .normal)
            self.selectedDataArr[indexPath.row].status = ""
        }
    }
}
