//
//  ExpositionViewController.swift
//  Expo1900
//
//  Created by Kyungmin Lee on 2020/12/24.
// 

import UIKit

class ExpositionViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let exposition = decodeExpostionData() {
            setupExpositionData(exposition)
        }
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
    
    private func setupExpositionData(_ exposition: Exposition) {
        if let linebreakIndex = exposition.title.firstIndex(of: "(") {
            let title = exposition.title
            titleLabel.text = "\(title[title.startIndex..<linebreakIndex])"
            subtitleLabel.text = "\(title[linebreakIndex..<title.endIndex])"
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if let str = numberFormatter.string(from: NSNumber(value: exposition.visitors)) {
            visitorsLabel.text = "방문객 : \(str) 명"
        }
        
        locationLabel.text = "개최지 : \(exposition.location)"
        
    }
    
}

