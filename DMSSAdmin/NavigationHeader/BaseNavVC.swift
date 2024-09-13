//
//  BaseNavVC.swift
//  DMSSAdmin
//
//  Created by Naveen Kourampalli on 03/09/24.
//

import UIKit

class BaseNavVC: UIViewController {
    var navView : NavigationHeaderView!
//    var menu : SideMenuNavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addProfileHeaderView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navView.backgroundColor = .clear
        navView.contentView.backgroundColor = .clear
    }
    func addProfileHeaderView()
    {
        self.navView = NavigationHeaderView(frame: .zero)
        self.view.addSubview(navView)
        navView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navView.heightAnchor.constraint(equalToConstant: 200)
        
        ])
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = navView.baseView.frame
        rectShape.position = navView.baseView.center
        rectShape.path = UIBezierPath(roundedRect: navView.baseView.bounds, byRoundingCorners: [.bottomLeft , .bottomRight ,], cornerRadii: CGSize(width: 20, height: 20)).cgPath
        navView.baseView.layer.backgroundColor = APPCOLORS.App_Color.cgColor
        navView.baseView.layer.mask = rectShape
        
        navView.menuBTN.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
    }
    @objc func menuButtonTapped()
    {
        debugPrint("leftBarButtonTapped")
//        present(menu, animated: true)
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
