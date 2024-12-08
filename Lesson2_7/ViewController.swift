//
//  ViewController.swift
//  Lesson2_7
//
//  Created by Ilnar on 04.12.2024.
//

import UIKit

final class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableData = Card.cardData
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        //$0.separatorStyle = .none
        $0.register(CardCellView.self, forCellReuseIdentifier: CardCellView.identifier)
        return $0
    }(UITableView(frame: view.frame, style: .plain))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardCellView.identifier, for: indexPath) as! CardCellView
        let card = tableData[indexPath.row]
        cell.setupCell(card: card)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCard = tableData[indexPath.row]
        let vc = SecondScreenVC(image: selectedCard.imageTitle, name: selectedCard.name, text: selectedCard.text)
        navigationController?.pushViewController(vc, animated: true)
    }

}

