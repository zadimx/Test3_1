//
//  MyCollectionViewCell.swift
//  TestThree
//
//  Created by Zinovatny Maksym on 01.11.2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

  @IBOutlet var myLabel: UILabel!
  @IBOutlet var myLabelHistory: UILabel!
  @IBOutlet var myTextView: UITextView!
  @IBOutlet var myImageView: UIImageView!
  static let identifier = "MyCollectionViewCell"
  static func nib() -> UINib {
    return UINib(nibName: "MyCollectionViewCell", bundle: nil)
  }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  public func configuration(with mainObject: Articles){
    myLabel.text = mainObject.publishedAt
    myLabelHistory.text = mainObject.url
    myTextView.text = mainObject.title
    print("#####configuration \(mainObject.urlToImage)")
    var url = URL(string: mainObject.urlToImage ?? "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg")
    var data = try? Data(contentsOf: url!)
    
    myImageView.image = UIImage(data: data!)
  }
  
//  func set() -> Other{
//    return Other(dateLabel: myLabel.text ?? <#default value#>, historyLabel: myLabelHistory.text, descriptionNewsTextView: myTextView.text, imageNews: myImageView.image)
//  }
}
