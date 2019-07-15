//
//  ViewController.swift
//  Currency
//
//  Created by Dima Opalko on 7/12/19.
//  Copyright © 2019 Dima Opalko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var pbTableView: UITableView!
    @IBOutlet weak var nbuTableView: UITableView!
    
    let privatURLString = "https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5"
    let nbuURLString = "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json"
    
    var privatArray: [PrivatBankCurrency] = []
    var nbuArray: [NBUCurrency] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pbTableView.dataSource = self
        nbuTableView.dataSource = self
        getPrivatData()
        getNBUData()
    }
    
    func getPrivatData() {
        if let url = URL(string: privatURLString) {
            URLSession.shared.dataTask(with: url) { ( data, responce, error) in
                if let data = data {
                    do {
                        let currencies = try JSONDecoder().decode([PrivatBankCurrency].self, from: data)
                        self.privatArray = currencies
                        print(self.privatArray)
                        DispatchQueue.main.async {
                            self.pbTableView.reloadData()
                        }
                    } catch {
                        print(error)
                    }
                }
                }.resume()
        }
        
    }
    func getNBUData() {
        if let url = URL(string: nbuURLString) {
            URLSession.shared.dataTask(with: url) { ( data, responce, error) in
                if let data = data {
                    do {
                        let currencies = try JSONDecoder().decode([NBUCurrency].self, from: data)
                        self.nbuArray = currencies
                        print(self.nbuArray)
                        DispatchQueue.main.async {
                            self.nbuTableView.reloadData()
                        }
                    } catch {
                        print(error)
                    }
                }
                }.resume()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count: Int?
        
        if tableView == self.pbTableView {
            count = privatArray.count
        }
        if tableView == self.nbuTableView {
            count = nbuArray.count
        }
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.pbTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "privatBankCell", for: indexPath) as! PrivatBankTableViewCell
            cell.ccyLabel.text = privatArray[indexPath.row].ccy
            cell.buyLabel.text = privatArray[indexPath.row].buy.dropLast(2) + " " + privatArray[indexPath.row].baseCCY
            cell.saleLabel.text = privatArray[indexPath.row].sale.dropLast(2) + " " + privatArray[indexPath.row].baseCCY
            return cell
            
        }
        if tableView == self.nbuTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NBUCell", for: indexPath) as! NBUTableViewCell
            cell.nameLabel.text = nbuArray[indexPath.row].name
            cell.saleLabel.text = String(nbuArray[indexPath.row].rate) + " UAH"
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.pbTableView {
            if indexPath.row == 0 {
                let index = IndexPath(row: 27, section: 0)
                nbuTableView.selectRow(at: index, animated: true, scrollPosition: .middle)
                tableView.deselectRow(at: indexPath, animated: true)
            }
            if indexPath.row == 1 {
                let index = IndexPath(row: 34, section: 0)
                nbuTableView.selectRow(at: index, animated: true, scrollPosition: .middle)
                tableView.deselectRow(at: indexPath, animated: true)
            }
            if indexPath.row == 2 {
                let index = IndexPath(row: 19, section: 0)
                nbuTableView.selectRow(at: index, animated: true, scrollPosition: .middle)
                tableView.deselectRow(at: indexPath, animated: true)
            }
        } else if tableView == self.nbuTableView {
            if indexPath.row == 19 {
                let index = IndexPath(row: 2, section: 0)
                self.pbTableView.selectRow(at: index, animated: true, scrollPosition: .none)
            }
            if indexPath.row == 27 {
                let index = IndexPath(row: 0, section: 0)
                self.pbTableView.selectRow(at: index, animated: true, scrollPosition: .none)
            }
            if indexPath.row == 34 {
                let index = IndexPath(row: 1, section: 0)
                self.pbTableView.selectRow(at: index, animated: true, scrollPosition: .none)
            }
        }
        
    }
}
