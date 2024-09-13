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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStatusBarColor()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = "Pantry"
        self.tableView.register(UINib(nibName: "TaskListTVC", bundle: nil), forCellReuseIdentifier: "TaskListTVC")
        pantryDataArr = pantryArr
        tableView.reloadData()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func didTappedOnSubmit(_ sender: Any) {
        print("submit")
    }
    
    @IBAction func didTappedOnAll(_ sender: Any) {
        self.pantryDataArr = pantryArr

        print("all")
    }
    @IBAction func didTappedOnCalender(_ sender: Any) {
        print("calender")
    }
    
    @IBAction func didTappedOnPending(_ sender: Any) {
        isSelectedStatus = "pending"
        self.pantryDataArr = self.selectedDataArr.filter({$0.status == isSelectedStatus})
        tableView.reloadData()
        print("Pending")
    }
    
    @IBAction func didTappedOnOpen(_ sender: Any) {
        isSelectedStatus = ""
        self.pantryDataArr = self.selectedDataArr.filter({$0.status == isSelectedStatus})
        tableView.reloadData()
        print("Open")
        
    }
    
    @IBAction func didTappedOnCOmpleted(_ sender: Any) {
        isSelectedStatus = "completed"
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
        cell.setupData(data: pantryDataArr[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        self.pantryDataArr[indexPath.row].status = isSelectedStatus
        
        
    }
}
