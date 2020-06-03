//
//  RadioViewController.swift
//  Course2Week4Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class RadioViewController: UIViewController {

    private var compactConstraints: [NSLayoutConstraint] = []
    private var regularConstraints: [NSLayoutConstraint] = []
    private var sharedConstraints: [NSLayoutConstraint] = []

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
        setupElements()
        setupConstraints()
        changeOrientation()
    }
}

extension RadioViewController {
// MARK: - Setup Elements
    func setupElements() {
        songLenth = UIProgressView()
        songLenth.progress = 0.5
        songLenth.translatesAutoresizingMaskIntoConstraints = false
        
        songName = UILabel()
        songName.text = "JM JARRE - Oxygene"
        songName.font = .systemFont(ofSize: 22, weight: .medium)
        songName.textColor = .black
        songName.textAlignment = .center
        songName.numberOfLines = 1
        songName.translatesAutoresizingMaskIntoConstraints = false
        
        volumeSlider = UISlider()
        volumeSlider.value = 0.5
        volumeSlider.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(albumImage)
        view.addSubview(songLenth)
        view.addSubview(volumeSlider)
        view.addSubview(songName)
    }

// MARK: - Setup Constraints
    func setupConstraints() {
        sharedConstraints.append(contentsOf: [
            songLenth.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            songLenth.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            albumImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),

            volumeSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            volumeSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            volumeSlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            volumeSlider.heightAnchor.constraint(equalToConstant: 31),

            songName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            songName.topAnchor.constraint(equalTo: songLenth.bottomAnchor),
            songName.bottomAnchor.constraint(equalTo: volumeSlider.topAnchor),
        ])

        compactConstraints.append(contentsOf: [
            songName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),

            songLenth.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 30),

            albumImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            albumImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            albumImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            albumImage.heightAnchor.constraint(equalTo: albumImage.widthAnchor, multiplier: 1.0)
        ])

        regularConstraints.append(contentsOf: [
            songLenth.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            songLenth.heightAnchor.constraint(equalToConstant: 2),
            albumImage.topAnchor.constraint(equalTo: songLenth.bottomAnchor, constant: 16), // Прошу обратить внимание на этот констрейнт. Если делаешь правильную привязку, то прогресс пропадает. Точнее становится высотой 0. А если ставишь songLenth.topAnchor, что не правильно, все работает 🤷‍♂️
            albumImage.bottomAnchor.constraint(equalTo: volumeSlider.topAnchor, constant: -16),
            albumImage.widthAnchor.constraint(equalTo: albumImage.heightAnchor, multiplier: 1.0/1.0),

            songName.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 16)
        ])
    }

// MARK: - Activate Constraints
    func generalConstraints() {
        NSLayoutConstraint.activate(sharedConstraints)
    }
    
    func compactCompactConstraints() {
        NSLayoutConstraint.deactivate(regularConstraints)
        NSLayoutConstraint.activate(compactConstraints)
    }
    
    func compactRegularConstraints() {
        NSLayoutConstraint.deactivate(compactConstraints)
        NSLayoutConstraint.activate(regularConstraints)
    }
// MARK: - Change Orientation
    func changeOrientation() {
        switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
        case (.compact, .compact):
        generalConstraints()
        compactRegularConstraints()

        case (.regular, .compact):
        generalConstraints()
        compactRegularConstraints()

        case (.compact, .regular):
        generalConstraints()
        compactCompactConstraints()

        default: break
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        changeOrientation()
    }
}


