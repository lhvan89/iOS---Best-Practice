//
//  ViewController.swift
//  Pokemon-Deeplinks
//
//  Created by lhvan on 5/24/18.
//  Copyright © 2018 lhvan. All rights reserved.
//

import UIKit
import SDWebImage

class ListViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    @IBAction func clearCache(_ sender: Any) {
        SDImageCache.shared().clearMemory()
        SDImageCache.shared().clearDisk()
        tableview.reloadData()
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListPokemon.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell") as! PokemonCellTableViewCell
        let dataCell = ListPokemon[indexPath.row]
        cell.initCell(imgName: dataCell.imageName, name: dataCell.name)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "pokemonDetailVC") as! DetailViewController
        vc.data = ListPokemon[indexPath.row]
//        print(vc.data)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

