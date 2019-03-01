//
//  MessagesViewController.swift
//  UITableViewExample
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var messagesTableView: UITableView!
    var messages: [[Message]] = []
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        messagesTableView.tableHeaderView = makeSupplementaryView(title: "Начало списка сообщений")
//        messagesTableView.tableFooterView = makeSupplementaryView(title: "Конец списка сообщений")
//
//        messagesTableView.separatorStyle = .singleLine
//        messagesTableView.separatorInset = UIEdgeInsets(top: 10, left: 10.0, bottom: 10, right: 10.0)
//        messagesTableView.separatorInsetReference = .fromAutomaticInsets
        
        messages = MessageProvider().messages()

        messagesTableView.register(UINib(nibName: String(describing: MessageTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MessageTableViewCell.self))

        messagesTableView.delegate = self
        messagesTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        messagesTableView.frame = view.frame
    }
    
    // MARK: - Private
    
    func makeSupplementaryView(title: String) -> UILabel {
        let supplementaryView = UILabel(frame: .zero)
        supplementaryView.text = title
        supplementaryView.font = UIFont.boldSystemFont(ofSize: 18.0)
        supplementaryView.sizeToFit()
        
        return supplementaryView
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatCell = tableView.dequeueReusableCell(withIdentifier: String(describing: MessageTableViewCell.self)) as! MessageTableViewCell
        
        chatCell.setChat(messages[indexPath.section][indexPath.row])
        
        return chatCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Сегодня"
        case 1:
            return "Неделю назад"
        case 2:
            return "Ранее"
        default:
            fatalError("Неизвестный номер секции. Ожидалось 0-2")
        }
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        var result: [UITableViewRowAction] = []
        
        result.append(UITableViewRowAction(style: .destructive, title: "Удалить") {
            _, _ in
            
            self.messages[indexPath.section].remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        })
        result.append(UITableViewRowAction(style: .normal, title: "Архивировать") {
            _, _ in
            
            self.messages[indexPath.section].remove(at: indexPath.row)
            tableView.reloadData()
        })
        
        return result
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero)
        
        switch section {
        case 0:
            label.text = "Всего сообщений сегодня: " + String(describing: messages[section].count)
        case 1:
            label.text = "Всего сообщений неделю назад: " + String(describing: messages[section].count)
        case 2:
            label.text = "Всего сообщений ранее: " + String(describing: messages[section].count)
        default:
            fatalError("Неизвестный номер секции. Ожидалось 0-2")
        }
        
        label.font = UIFont.systemFont(ofSize: 13.0)
        label.sizeToFit()
        
        return label
    }

}
