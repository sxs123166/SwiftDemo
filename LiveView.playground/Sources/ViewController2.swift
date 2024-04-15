import Foundation
import UIKit

public class ViewController2 : UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        let label: UILabel = UILabel()
        label.frame = CGRect(x: 50, y: 200, width: 300, height: 50)
        label.text = "页面2"
        label.textColor = .white
        label.backgroundColor = .red
        view.addSubview(label)
    }
}
