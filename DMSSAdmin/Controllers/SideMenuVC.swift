//
//  SideMenuVC.swift
//  DMSSAdmin
//
//  Created by Naveen Kourampalli on 24/10/24.
//

import UIKit

class SideMenuVC: UIViewController {

    var tableDataSource : [SideMenuItem] = SideMenuItem.allCases

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
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

//MARK: - TableView DataSource & Delegate
extension SideMenuVC : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
        cell.selectionStyle = .none
        let contentView = cell.contentView.viewWithTag(50)!
        let imgView = contentView.viewWithTag(100) as! UIImageView
        imgView.image =  UIImage(named: tableDataSource[indexPath.row].iconName)?.withRenderingMode(.alwaysTemplate).withTintColor(.black)
        let titleLabel = contentView.viewWithTag(101) as! UILabel
        titleLabel.text = tableDataSource[indexPath.row].rawValue
        titleLabel.textColor = .black
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.dismiss(animated: true)
        if let vc = tableDataSource[indexPath.row].viewController {
            self.navigationController?.pushViewController(vc, animated: false)
        } else {//change Job Number case
        }
        
    }

    
    
}


//MARK: - Models
extension SideMenuVC
{
    enum SideMenuItem : String, CaseIterable
    {
        case download = "Download"
        case assign     = "Assign"
        case addTask         = "Add Task"
        case reminders         = "Reminders"
        case attendance         = "Attendance"
        case settings   = "Settings"
        
        
        var iconName : String
        {
            switch self
            {
                
            case .download:
                return "download"
            case .assign:
                return "distribution"
            case .addTask:
                return "lists"
            case .reminders:
                return "reminders"
            case .attendance:
                return "attendace"
            case .settings:
                return "settings"
            }
        }
        
        var viewController : UIViewController?
        {
            switch self
            {
                
            case .download:
                return DashBoardVC.instace()
            case .assign:
                return AddMembersVC.instace()
            case .addTask:
                return DashBoardVC.instace()
            case .reminders:
                return DashBoardVC.instace()
            case .attendance:
                return DashBoardVC.instace()
            case .settings:
                return DashBoardVC.instace()
            }
        }
    }
    
}
