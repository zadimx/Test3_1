//
//  CollectionViewTableViewCell.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 17.11.2021.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
  
  var collectionViewController = CollectionViewController()
  @IBOutlet weak var collectionView: UICollectionView!
//  {
//    didSet{
//      collectionView.register(CollectionViewController.self, forCellWithReuseIdentifier: "nil")
//    }
//  }
  @IBOutlet weak var view: UIView!
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
    print("####CollectionViewTableViewCell")
//    constrationCollectionView()
    collectionView.addSubview(collectionViewController.view)
    
  }
  func constrationCollectionView(){
    collectionViewController.view.translatesAutoresizingMaskIntoConstraints = false
    collectionViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    collectionViewController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
    collectionViewController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    collectionViewController.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
  }
  


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


}
