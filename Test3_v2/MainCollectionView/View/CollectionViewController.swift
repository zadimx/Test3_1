//
//  CollectionViewController.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 18.11.2021.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource{
  var indexOfPageToRequest = 1
  var presenter: CollectionViewPresenterProtocol!
  let networkService = NetworkService()
//  var searchPerson: [Articles]?
  
  
  

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
    cell.configuration(with: presenter.articles?[indexPath.row] ?? Articles(title: "Привет, это тестовый Title Он будет стоять до парсинга JSON1", content: "Привет, это тестовый TextView Он будет стоять до парсинга JSON1", urlToImage: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg", url: "history1", publishedAt: "1 min ago"))
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 300, height: 800)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    let offsetX = scrollView.contentOffset.x
        let contentHeight = scrollView.contentSize.width

        if offsetX > contentHeight - scrollView.frame.size.width {

            // increments the number of the page to request
            indexOfPageToRequest += 1
          print("%%%%% \(offsetX) \(scrollView.frame.size.width) \(contentHeight)")
            // call your API for more data
//            loadSaved(indexOfPageToRequest)
          presenter.getArticles()
            // tell the table view to reload with the new data
//            self.tableView.reloadData()
          collectionView.reloadData()
        }
  }
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
    if indexPath.row == (presenter.articles?.count ?? 1)-1 && indexPath.row<=5{


//      networkService.getArticles(urlString: "https://newsapi.org/v2/top-headlines?country=us&pageSize=1&page=\(objectOtherTableViewCellModel.count-1)&apiKey=dda979c66ca84f9795d7856f49458efe") {[weak self]/*утечка данных*/ (result) in
//          switch result {
//
//            case .success(let searchPerson):
//                self?.searchPerson = searchPerson
//              self?.objectOtherTableViewCellModel.append(searchPerson?[0] ?? Articles(title: "Привет, это тестовый Title Он будет стоять до парсинга JSON1", content: "Привет, это тестовый TextView Он будет стоять до парсинга JSON1", urlToImage: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg", url: "history1", publishedAt: "1 min ago"))
//
//              collectionView.reloadData()
//            case .failure(let error):
//                print("error", error)
//          }
//      }

    }
  }

  
  @IBOutlet weak var collectionView: UICollectionView!
  
  func constrationCollectionView(){
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    view.heightAnchor.constraint(equalToConstant: 500).isActive = true
  }
    override func viewDidLoad() {
        super.viewDidLoad()
      collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
      collectionView.delegate = self
      collectionView.dataSource = self
      constrationCollectionView()
      view.addSubview(collectionView)
      collectionView.reloadData()
      
        // Do any additional setup after loading the view.
    }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("####didSelectItemAt \(indexPath.row)")
    let data = presenter.articles?[indexPath.row]
//    let data = Articles(title: objectOtherTableViewCellModel[indexPath.row].descriptionNewsTextView, content: objectOtherTableViewCellModel[indexPath.row].descriptionNewsTextView, urlToImage: objectOtherTableViewCellModel[indexPath.row].imageNews, url: objectOtherTableViewCellModel[indexPath.row].historyLabel, publishedAt: objectOtherTableViewCellModel[indexPath.row].dateLabel)
//    let detailCollectionViewController = AssemblyModelBuilder.createDateilCollectionViewModule(data: data)
//    navigationController?.pushViewController(detailCollectionViewController, animated: true)
    presenter.tabOnTheArticles(articles: data)
  }
}
extension CollectionViewController: UICollectionViewDelegate{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print("^^^^CollectionViewController \(presenter?.articles)")
    return presenter?.articles?.count ?? 0
  }
}
extension CollectionViewController: CollectionViewProtocol{
  func success() {
    collectionView.reloadData()
  }
  
  func failure(error: Error) {
    print("OSHIBKA \(error)")
  }
  
  
}
