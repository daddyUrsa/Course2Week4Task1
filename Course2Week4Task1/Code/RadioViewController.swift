//
//  RadioViewController.swift
//  Course2Week4Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class RadioViewController: UIViewController {
    
    var volumeSlider: UISlider!
    var songLenth: UIProgressView!
    var songName: UILabel!
    lazy var albumImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView = UIImageView(image: UIImage(named: "oxygene"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {

        setupItems()
        setupМolumeSliderConstraints()
        
    }
    
}

extension RadioViewController {
    func setupItems() {
        songLenth = UIProgressView()
        songLenth.progress = 0.5
        songLenth.translatesAutoresizingMaskIntoConstraints = false
        
        songName = UILabel()
        songName.text = "JEAN MICHAEL JARRE - Oxygene"
        songName.textAlignment = .center
        songName.translatesAutoresizingMaskIntoConstraints = false
        
        volumeSlider = UISlider()
        volumeSlider.value = 0.5
        volumeSlider.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(albumImage)
        view.addSubview(songLenth)
        view.addSubview(volumeSlider)
        view.addSubview(songName)
        
        setupImageContraints()
        setupМolumeSliderConstraints()
        setupSongLengthConstraints()
        setupSongNameConstraints()

    }
        
    func setupМolumeSliderConstraints() {
        [volumeSlider.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
        volumeSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        volumeSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ]
        .forEach { $0.isActive = true }
    }
    
    func setupSongNameConstraints() {
        [songName.topAnchor.constraint(equalTo: songLenth.bottomAnchor),
//         songName.heightAnchor.constraint(equalToConstant: volumeSlider.topAnchor.)
//        songName.bottomAnchor.constraint(equalTo: volumeSlider.topAnchor),
        songName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        songName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ]
        .forEach { $0.isActive = true }
    }
    
    func setupSongLengthConstraints() {
        [songLenth.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 30),
        songLenth.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        songLenth.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ]
        .forEach { $0.isActive = true }
    }
    
    func setupImageContraints() {
        [albumImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
         albumImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
         albumImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
         albumImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
         albumImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0)
        ]
        .forEach { $0.isActive = true }
    }
}
