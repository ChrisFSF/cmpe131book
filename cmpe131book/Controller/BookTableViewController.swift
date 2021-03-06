//
//  BOOKTableViewController.swift
//  BOOK
//
//  Created by 安博 on 3/13/19.
//  Copyright © 2019 安博. All rights reserved.
//

import UIKit

class BOOKTableViewController: UITableViewController, UISearchBarDelegate{
    let BooKINFO : Bookinfo
    let function : functions
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var currentbook = [Infobase]()
    var filteredbook = [Infobase]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100 // set the hight of each cell
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        currentbook = BooKINFO.Book
    }
    required init?(coder aDecoder: NSCoder) {
        BooKINFO = Bookinfo()
        function = functions()
        super.init(coder: aDecoder)
    }// init book info
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentbook.count
    }// init number of cells
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)// enable animation for selection
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let position = currentbook[indexPath.row]
        textconfig(for: cell, with: position)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Passdetail"{
            if let DetailTableViewController = segue.destination as? DetailTableViewController{
                if let cell = sender as? UITableViewCell, let indexp = tableView.indexPath(for: cell){
                    let information = BooKINFO.Book[indexp.row]
                    DetailTableViewController.INFO = information
                }
            }
        }
    }// pass data to detailtableviewcontroller
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        currentbook.remove(at: indexPath.row)
        BooKINFO.Book.remove(at: indexPath.row)
        let InDexpath = [indexPath]
        tableView.deleteRows(at: InDexpath, with: .fade)
    }//delete function
    
    func textconfig(for cell : UITableViewCell, with item : Infobase){
        cell.textLabel!.text = item.title
        cell.imageView?.image = UIImage(named: item.ima)
        cell.textLabel!.textColor = function.randomColor()
        cell.detailTextLabel!.textColor = function.randomColor()
    }// set textconten for each cell

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            currentbook = BooKINFO.Book
            tableview.reloadData()
            return}
        currentbook = BooKINFO.Book.filter({ (Infobase) -> Bool in
            Infobase.title.lowercased().contains(searchText.lowercased())
        })
        tableview.reloadData()
    }
    
}




