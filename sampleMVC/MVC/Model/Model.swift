//
//  Model.swift
//  sampleMVC
//
//  Created by 手塚友健 on 2022/02/02.
//

import Foundation

// MARK: -- Model
final class Model {
    
    private(set) var count: Int = 0 {
        didSet {
            notificationCenter.post(name: .init(rawValue: "count"), object: nil, userInfo: ["count": count])
        }
    }
    
    let notificationCenter: NotificationCenter = NotificationCenter()
    
    func plus() { count += 1 }
    
    func minus() { count -= 1 }
}
