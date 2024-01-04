

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        UITableviewCell()
      
    }
    
    func UITableviewCell(){
        self.mTableView.delegate = self
        self.mTableView.dataSource = self
        mTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        mTableView.register(UINib(nibName: "dashboardBannerCell", bundle: nil), forCellReuseIdentifier: "dashboardBannerCell")
        mTableView.register(UINib(nibName: "ActivityRoutineViewCell", bundle: nil), forCellReuseIdentifier: "ActivityRoutineViewCell")
        mTableView.register(UINib(nibName: "InnerPeaceCell", bundle: nil), forCellReuseIdentifier: "InnerPeaceCell")
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
        let cell = mTableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as! ItemTableViewCell
            
            return cell
        
        } else if indexPath.section == 1 {
            let cell = mTableView.dequeueReusableCell(withIdentifier: "dashboardBannerCell", for: indexPath) as! dashboardBannerCell
            return cell
            
        } else if indexPath.section == 2 {
            let cell = mTableView.dequeueReusableCell(withIdentifier: "ActivityRoutineViewCell", for: indexPath) as! ActivityRoutineViewCell

            return cell
        }else if indexPath.section == 3 {
            let cell = mTableView.dequeueReusableCell(withIdentifier: "InnerPeaceCell", for: indexPath) as! InnerPeaceCell

            return cell
        }

        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 110
        } else if indexPath.section == 1{
            return 250
        }else if indexPath.section == 2{
            return 200
        }else if indexPath.section == 3{
            return 200
        }
       return CGFloat()
        
    }
   

}
