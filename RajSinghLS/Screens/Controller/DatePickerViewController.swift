

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer()
        
    }
    
    @IBAction func setReminderButtonTapped(_ sender: UIButton) {
        datepicker()
    }
    
    func datepicker(){
        let selectedDate = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        let formattedTime = dateFormatter.string(from: selectedDate)
        print("Selected time: \(formattedTime)")
        let notificationContent = UNMutableNotificationContent()
        let components = Calendar.current.dateComponents([.hour, .minute], from: selectedDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let identifier = UUID().uuidString
        let request = UNNotificationRequest(identifier: identifier, content: notificationContent, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully!")
                self.displayMessage("Notification scheduled successfully")
            }
          
        }
       
    }
    
    func gradientLayer(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemGreen.cgColor, UIColor.systemBlue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
        datePicker.datePickerMode = .time
    }
    
    
    @IBAction func ClickNextButton(_ sender: UIButton) {
        let moveVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
       self.navigationController?.pushViewController(moveVC, animated: true)
    }

}
