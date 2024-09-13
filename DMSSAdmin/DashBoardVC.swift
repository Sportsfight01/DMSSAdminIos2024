//
//  DashBoardVC.swift
//  DMSSAdmin
//
//  Created by Naveen Kourampalli on 02/09/24.
//

import UIKit


class DashBoardVC: UIViewController, UICollectionViewDelegate{
    
    
    var homeScreenData = [categoriesData]()
    var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var baseView: UIView!
    
    
    var initialIndex : Int = 0
    var currentIndex : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        collectionView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.baseView.roundCorners([.bottomLeft,.bottomRight], radius: 30)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    
    func setupView(){
 
        
        homeScreenData = [
            categoriesData(name: "Cabins",type: "0", image: "Cabin"),
            categoriesData(name: "Games Room",type: "1", image: "GameROOM"),
            categoriesData(name: "Work Station",type: "2", image: "WorkStation"),
            categoriesData(name: "Pantry",type: "3", image: "Pantry"),
            categoriesData(name: "Rest Rooms",type: "4", image: "Restrooms"),
            categoriesData(name: "General Area",type: "5", image: "GenralArea")]
       
        collectionView.register(DashboardCVC.nib, forCellWithReuseIdentifier: DashboardCVC.identifier)
       
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionMethods()
    }
    
    
}

extension DashBoardVC{
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        // Define the item size and layout
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5), // Half of the group width
            heightDimension: .fractionalHeight(1.5) // Full height of the group
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4) // Optional insets for spacing

        // Define the group size and layout
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), // Full width of the section
            heightDimension: .absolute(160) // Fixed height for the group
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item])

        // Define the section and layout
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10 // Spacing between groups

        // Return the compositional layout with the defined section
        return UICollectionViewCompositionalLayout(section: section)
    }
    func collectionMethods(){
        //MARK: - CollectionView Layout & Datasource
        
        dataSource = UICollectionViewDiffableDataSource<Int, String>(collectionView: collectionView, cellProvider: {[self] collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardCVC.identifier, for: indexPath) as! DashboardCVC
            cell.categoryLBL.text = homeScreenData[indexPath.item].name
            let image = homeScreenData[indexPath.item].image
            cell.imageView.image = UIImage(named: image)
            
            
            return cell
        })
        var snapShot = NSDiffableDataSourceSnapshot<Int, String>()
        snapShot.appendSections([0])
        let items = homeScreenData.map({$0.name})
        snapShot.appendItems(items)
        dataSource.apply(snapShot, animatingDifferences: true)
        
        collectionView.scrollToItem(at: IndexPath(item: initialIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if homeScreenData[indexPath.item].type == "3"{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PantryVC") as! PantryVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
