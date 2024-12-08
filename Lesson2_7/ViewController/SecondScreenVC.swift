//
//  SecondScreenVC.swift
//  Lesson2_7
//
//  Created by Ilnar on 04.12.2024.
//

import UIKit

protocol ControllerProtocol: AnyObject {
    func setConstreints()
}

protocol SecondViewControllerProtocol: ControllerProtocol {
    var scrollView: UIScrollView { get set }
    var scrollViewContent: UIView { get set }
}

final class SecondScreenVC: UIViewController, SecondViewControllerProtocol, UIScrollViewDelegate {
    private let imageName: String
    private let cardName: String
    private let textCard: String
    
    init(image: String, name: String, text: String) {
        self.imageName = image
        self.cardName = name
        self.textCard = text
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var textLabel: UILabel = {
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.text = textCard
        return $0
    }(UILabel())
    
    lazy var scrollView: UIScrollView = {
        $0.contentInsetAdjustmentBehavior = .never
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsVerticalScrollIndicator = true
        $0.addSubview(scrollViewContent)
        $0.delegate = self
        return $0
    }(UIScrollView())
    
    lazy var scrollViewContent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(textLabel)
        return $0
    }(UIView())
    
    private lazy var imageTitle: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: imageName)
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        return $0
    }(UIImageView())
    
    private lazy var hStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .equalSpacing
        return $0
    }(UIStackView())
    
    private lazy var nameLabel: UILabel = {
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = cardName
        return $0
    }(UILabel())
    
    private lazy var dateLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = Card.cardData[0].date
        $0.font = .systemFont(ofSize: 16, weight: .light)
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageTitle)
        hStack.addArrangedSubview(nameLabel)
        hStack.addArrangedSubview(dateLabel)
        view.addSubview(hStack)
        view.addSubview(scrollView)
        setConstreints()
        view.backgroundColor = .systemBackground
    }
    
    func setConstreints() {
        NSLayoutConstraint.activate([
            imageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            imageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageTitle.heightAnchor.constraint(equalToConstant: 163),
            
            hStack.topAnchor.constraint(equalTo: imageTitle.bottomAnchor, constant: 12),
            hStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            hStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            scrollView.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 12),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollViewContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            textLabel.topAnchor.constraint(equalTo: scrollViewContent.topAnchor, constant: 12),
            textLabel.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -20),
            textLabel.bottomAnchor.constraint(equalTo: scrollViewContent.bottomAnchor, constant: -20)
        ])
    }
}
