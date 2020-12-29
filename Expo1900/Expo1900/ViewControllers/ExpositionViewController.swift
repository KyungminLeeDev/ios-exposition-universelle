//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    // MARK: - Methods
    private func decodeExpostionData() -> Exposition? {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            print("DataAsset가져오기 실패")
            return nil
        }
        
        do {
            let exposition = try JSONDecoder().decode(Exposition.self, from: dataAsset.data)
            return exposition
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
}

