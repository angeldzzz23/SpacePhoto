//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Angel Zambrano on 2/4/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: properties
    
    let image: UIImageView = {
    let imageview = UIImageView()
        imageview.backgroundColor = .blue
        return imageview
        
    }()
    
    // creating extract
    let spaceBottom: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 5).isActive = true
       return view
    }()
    
    // creating extract
    let spaceViewTop: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 5).isActive = true
       return view
    }()
    
    
    let descritionLbl: UILabel = {
        let label = UILabel()
        label.text = """
             ven though Jupiter was the only planet visible in the evening sky on February 2, it shared the twilight above the western horizon with the Solar System\'s brightest moons. In a single exposure made just after sunset, the Solar System\'s ruling gas giant is at the upper right in this telephoto field-of-view from Cancun, Mexico. The snapshot also captures our fair planet\'s own natural satellite in its young crescent phase. The Moon\'s disk looms large, its familiar face illuminated mostly by earthshine. But the four points of light lined-up with Jupiter are Jupiter\'s own large Galilean moons. Top to bottom are Ganymede, [Jupiter], Io, Europa, and Callisto. Ganymede, Io, and Callisto are physically larger than Earth\'s Moon while water world Europa is only slightly smaller.
             """
        label.numberOfLines = 0
        return label
    }()
    
    let copyRightLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Robert Fedez"
        return label
    }()
    
    
    lazy var stackview = UIStackView(arrangedSubviews: [image, spaceViewTop, descritionLbl,spaceBottom, copyRightLbl])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        stackview.backgroundColor = .red
        stackview.distribution = .fill
        stackview.axis = .vertical
        view.addSubview(stackview)
        stackview.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 30, left: 30, bottom: 30, right: 30))
        

    }


}

