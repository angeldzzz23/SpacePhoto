//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Angel Zambrano on 2/4/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: properties
    
    let imageView: UIImageView = {
    let imageview = UIImageView()
//        imageview.backgroundColor = .blue
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
    
    let photoInfoController = PhotoInfoController()
    
    
    
    let descritionLbl: UILabel = {
        let label = UILabel()
        label.text = """
             edwdwdwdwdw
             cede
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
    
    
    lazy var stackview = UIStackView(arrangedSubviews: [imageView, spaceViewTop, descritionLbl,spaceBottom, copyRightLbl])
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        setUpLayout()
        
            Task {
                do {
                    let photoInfo = try await photoInfoController.fetchPhotoInfo()
//                    self.title = photoInfo.title
                    updateUI(with: photoInfo)
//                    self.descritionLbl.text = photoInfo.description
//                    self.copyRightLbl.text = photoInfo.copyright
                } catch {
//                    self.title = "Error Fetching Photo"
//                    self.descritionLbl.text = error.localizedDescription
//                    self.copyRightLbl.text = ""
                    updateUI(with: error)
                }
            }
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
          Task {
                do {
                    let image = try await photoInfoController.fetchImage(from:
                       photoInfo.url)
                    title = photoInfo.title
                    imageView.image = image
                    descritionLbl.text = photoInfo.description
                    copyRightLbl.text = photoInfo.copyright
                } catch {
                    updateUI(with: error)
                }
            }

    }
    
    func updateUI(with error: Error) {
        title = "Error fetching photo"
//        imageView.image = UIImage(systemName: <#T##String#>)
        descritionLbl.text = error.localizedDescription
        copyRightLbl.text = ""
    }
    
    fileprivate func setUpLayout() {
        stackview.backgroundColor = .red
        stackview.distribution = .fill
        stackview.axis = .vertical
        view.addSubview(stackview)
        stackview.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 30, left: 30, bottom: 30, right: 30))
    }

}

