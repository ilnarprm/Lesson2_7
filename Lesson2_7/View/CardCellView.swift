//
//  CardCellView.swift
//  Lesson2_7
//
//  Created by Ilnar on 05.12.2024.
//

import UIKit

final class CardCellView: UITableViewCell{
    static let identifier = "CardCellView"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var cardView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 30
        $0.addSubview(imageTitle)
        $0.addSubview(nameLabel)
        $0.addSubview(descriptionLabel)
        $0.addSubview(hStack)
        $0.addSubview(buttonShowDetails)
        return $0
    }(UIView())
    
    private lazy var imageTitle: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 24
        return $0
    }(UIImageView())
    
    private lazy var nameLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        return $0
    }(UILabel())
    
    private lazy var descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 14, weight: .light)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var hStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 12
        $0.alignment = .fill
        $0.distribution = .fillEqually
        return $0
    }(UIStackView())
    
    private lazy var buttonShowDetails: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("show details", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 18
        return $0
    }(UIButton(primaryAction: UIAction(handler: { [weak self]_ in
        guard let self else { return }
        //let vc = SecondScreenVC()
        //navigationController?.pushViewController(vc, animated: true)
    })))
    
    func setupCell(card: Card) {
        imageTitle.image = UIImage(named: card.imageTitle)
        nameLabel.text = card.name
        descriptionLabel.text = card.description
        
        card.image.forEach {img in
            let imageView = UIImageView()
            imageView.image = UIImage(named: img)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 24
            hStack.addArrangedSubview(imageView)
        }
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            imageTitle.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            imageTitle.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            imageTitle.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            imageTitle.heightAnchor.constraint(equalToConstant: 163),
            
            nameLabel.topAnchor.constraint(equalTo: imageTitle.topAnchor, constant: 70),
            nameLabel.leadingAnchor.constraint(equalTo: imageTitle.leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: imageTitle.trailingAnchor, constant: -24),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageTitle.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: imageTitle.trailingAnchor, constant: -24),
            
            hStack.topAnchor.constraint(equalTo: imageTitle.bottomAnchor, constant: 12),
            hStack.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            hStack.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            hStack.heightAnchor.constraint(equalToConstant: 100),
            
            buttonShowDetails.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 12),
            buttonShowDetails.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            buttonShowDetails.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            buttonShowDetails.heightAnchor.constraint(equalToConstant: 50),
            
            buttonShowDetails.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16)
        ])
    }
}
