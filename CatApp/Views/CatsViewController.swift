//
//  ViewController.swift
//  CatApp
//
//  Created by Andres Diaz Orozco on 30/04/23.
//

import UIKit
import Kingfisher

class CatsViewController: UITableViewController {
    let cellIdentifier = "CatTableViewCell"
    
    private var viewModel = CatViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(.init(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        viewModel.getCat { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cats.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CatTableViewCell", for: indexPath) as? CatTableViewCell
        else { return UITableViewCell() }

        cell.breedNameLabel.text = viewModel.cats[indexPath.row].breedName
        cell.originLabel.text = "Pais de origen: " + (viewModel.cats[indexPath.row].origin ?? "")
        cell.intelligence.text = "Inteligencia: \(viewModel.cats[indexPath.row].intelligence ?? 0)"
        
        if let imageUrl = viewModel.cats[indexPath.row].imageUrl,
           let url = URL(string: "https://cdn2.thecatapi.com/images/\(imageUrl).jpg") {
            cell.catImageView.kf.indicatorType = .activity
            cell.catImageView.kf.setImage(with: url)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 384
    }
}

class ImageHelper {
    static func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let imageURL = URL(string: urlString) else {
            completion(nil)
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else {
                completion(nil)
                return
            }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}
