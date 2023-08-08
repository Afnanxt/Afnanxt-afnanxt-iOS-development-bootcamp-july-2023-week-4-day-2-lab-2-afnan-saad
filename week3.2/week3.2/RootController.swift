//
//  RootController.swift
//  week3.2
import Foundation
import UIKit
import SnapKit

@MainActor

class RootViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate{
  
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
      @IBOutlet weak var label1: UILabel!
      @IBOutlet weak var label2: UILabel!
      @IBOutlet weak var CounterButton: UIButton!
      
      var mostPopular = ["TV & Movies", "recipes", "Celebs", "Resturants","tech companies"]
      var lifeStyle = ["Travel Tips" , "Fashion", "Cars","home product"]
      var health = ["exercise", "Health"]
      
      var counter = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate  = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
                
        label1.text = "Personalize your feed"
        label2.text = " you can Select more then 1 "
        
        
        
                         
                         }
    
    // cell format
   
}
    
struct myText{
    var text1:String
   
    
}
extension RootViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return mostPopular.count
        case 1:
            return lifeStyle.count
        case 2:
            return health.count
        default:
            return mostPopular.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            cell.layer.cornerRadius = 12
            switch indexPath.section {
            case 0:
                cell.itemName.text = mostPopular[indexPath.row]
            case 1:
                cell.itemName.text = lifeStyle[indexPath.row]
            case 2:
                cell.itemName.text = health[indexPath.row]
            default:
                break
            }
            
            return cell
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           counter = counter + 1
           CounterButton.titleLabel?.text = "\(counter) selected"
       }
       
       func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
           counter = counter - 1
           CounterButton.titleLabel?.text = "\(counter) selected"
       }
       
       func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
           
           if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader {
               switch indexPath.section {
               case 0:
                   header.sectionHeaderlabel.text = "Most Popular"
               case 1:
                   header.sectionHeaderlabel.text = "Life Style"
               case 2:
                   header.sectionHeaderlabel.text = "Health"
               default:
                   break
               }
               return header
           }
           return UICollectionReusableView()
       }
   }


