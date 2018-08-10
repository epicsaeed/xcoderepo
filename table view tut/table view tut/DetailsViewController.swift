//
//  DetailsViewController.swift
//  table view tut
//
//  Created by Saeed on 23.07.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit
import WebKit


class DetailsViewController: UIViewController {

    var details: Movies? = nil
    
//    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var directorTitle: UILabel!
    @IBOutlet weak var genreTitle: UILabel!
    @IBOutlet weak var ratingTitle: UILabel!
    @IBOutlet weak var plotTitle: UILabel!
    @IBOutlet weak var trailerView: WKWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        posterImage.image = UIImage(named: (details?.image)!)
        movieTitle.text = (details?.name)! + " (\(details!.year))"
        directorTitle.text = "Director: " + (details?.director)!
        genreTitle.text = details?.genre
        ratingTitle.text = "IMDB Rating: " + (details?.rating)!
        plotTitle.text = details?.plot
//        getVideo((details?.videoCode)!)
        
    }
    
    func getVideo(_ videoCode: String){
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        trailerView.load(URLRequest(url: url!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
