

import UIKit

class ActivityRoutineViewCell: UITableViewCell {

    @IBOutlet weak var ViewRoutine: UIView!
    @IBOutlet weak var gratitudeLbl: UILabel!
    @IBOutlet weak var journalLbl: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var numLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var ActivityRoutineLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        ViewRoutine.backgroundColor = UIColor(red: 245/255.0, green: 102/255.0, blue: 88/255.0, alpha: 1.0)
           
    }

    
}
