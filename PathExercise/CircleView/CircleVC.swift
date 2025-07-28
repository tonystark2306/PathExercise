//
//  CircleVC.swift
//  PathExercise
//
//  Created by iKame Elite Fresher 2025 on 7/28/25.
//

import UIKit

class CircleVC: UIViewController {
    
    @IBOutlet weak var randButton: UIButton!
    @IBOutlet weak var randValue: UILabel!
    @IBOutlet weak var contentView: UIView!
    private let trackLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCircle()
        setProgress(to: 28)
    }
    
    private func setupCircle() {
        let radius: CGFloat = 100
        let lineWidth: CGFloat = 25
        let center = CGPoint(x: contentView.bounds.midX, y: contentView.bounds.midY)
        let startAngle = CGFloat.pi * 4/5
        let endAngle = CGFloat.pi/5
        
        let path = UIBezierPath(arcCenter: center, radius: radius,
                                startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        trackLayer.path = path.cgPath
        trackLayer.strokeColor = UIColor.color1.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = lineWidth
        trackLayer.lineCap = .round
        contentView.layer.addSublayer(trackLayer)
        
        progressLayer.path = path.cgPath
        progressLayer.strokeColor = UIColor.systemTeal.cgColor
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineWidth = lineWidth
        progressLayer.strokeEnd = 0
        progressLayer.lineCap = .round
        contentView.layer.addSublayer(progressLayer)
    }
    
    func setProgress(to value: CGFloat) {
        let ratio = min(max(value / 100, 0), 1)
        progressLayer.strokeEnd = ratio
        randValue.text = "\(Int(value)) / \(100)"
    }
    
    
    @IBAction func didTapped(_ sender: Any) {
        let randomValue = CGFloat(Int.random(in: 1...100))
        setProgress(to: randomValue)
    }
}
