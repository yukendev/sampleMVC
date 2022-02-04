//
//  ViewController.swift
//  sampleMVC
//
//  Created by 手塚友健 on 2022/02/02.
//

import UIKit

// MARK: -- Controller
class ViewController: UIViewController {
    
    // ControllerがViewを保持
    @IBOutlet weak var countLabel: UILabel!
    
    // ControllerがModelを保持
    var model: Model? {
        didSet { registerModel() }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = Model()
        
    }
    
    private func registerModel() {
        guard let model = model else { return }
        
        // Modelの値をControllerが監視
        model.notificationCenter.addObserver(forName: .init(rawValue: "count"),
                                             object: nil,
                                             queue: nil) { notification in
            if let count = notification.userInfo?["count"] as? Int {
                // Viewの描画を更新
                self.countLabel.text = "\(count)"
                if count % 5 == 0 && count != 0 {
                    self.countLabel.textColor = .red
                } else {
                    self.countLabel.textColor = .black
                }
            }
        }
    }
    
    // View -> Controller -> Modelに処理を依頼
    @IBAction func minus(_ sender: Any) { model?.minus() }
    @IBAction func plus(_ sender: Any) { model?.plus() }
    

}
