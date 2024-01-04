

import UIKit

class dashboardBannerCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var mCollectionView: UICollectionView!
    let layout = UICollectionViewFlowLayout()
   // let bannerImages = [UIImage(named: "icon.jpg"),UIImage(named: "icon.jpg"),UIImage(named: "icon.jpg")]
    override func awakeFromNib() {
        super.awakeFromNib()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 10
        mCollectionView.setCollectionViewLayout(layout, animated: true)
        self.mCollectionView.delegate = self
        self.mCollectionView.dataSource = self
        mCollectionView.register(UINib(nibName: "dashboardCollectionCell", bundle: nil), forCellWithReuseIdentifier: "dashboardCollectionCell")
    }


}
extension dashboardBannerCell: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
       
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mCollectionView.dequeueReusableCell(withReuseIdentifier: "dashboardCollectionCell", for: indexPath) as! dashboardCollectionCell
       // cell.bannerImg.image = bannerImages[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//         let collectionwidth =  mCollectionView.bounds.width
//       return CGSize(width: collectionwidth/1, height: collectionwidth/1)
//        return CGSize(width: 300, height: 200)
        
        let widthPerItem = mCollectionView.frame.width  - layout.minimumInteritemSpacing
        return CGSize(width:widthPerItem, height: 200)
    }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       return 1
     }

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top:5,left:5,bottom: 5,right: 5)
     
     
     }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 1
     }
    
}
