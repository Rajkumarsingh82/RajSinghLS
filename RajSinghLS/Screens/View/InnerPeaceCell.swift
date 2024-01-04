
import UIKit

class InnerPeaceCell: UITableViewCell {

    @IBOutlet weak var ViewRoutine: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        ViewRoutine.backgroundColor = UIColor.systemTeal
    }

    
}
