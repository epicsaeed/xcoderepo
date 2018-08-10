//
//  StoriesTableViewController.swift
//  table view tut
//
//  Created by Saeed on 23.07.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit

struct Movies{
    var id: Int
    var name: String
    var year: String
    var rating: String
    var genre: String
    var image: String
    var director: String
    var plot : String
    var videoCode: String
    var still: String
}

var movies = [
    Movies(id: 1, name: "Pulp Fiction", year: "1994", rating: "8.9", genre: "Drama/Crime",image: "PulpFiction", director: "Quentin Tarantino",plot:"The lives of two mob hitmen, a boxer, a gangster's wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",videoCode: "5ZAhzsi1ybM",still:"PulpFictionStill"),
    Movies(id: 2, name: "The Shape Of Water", year: "2017", rating: "7.4", genre: "Adventure/Drama/Fantasy",image: "TheShapeOfWater",director:"Guillermo del Toro",plot:"At a top secret research facility in the 1960s, a lonely janitor forms a unique relationship with an amphibious creature that is being held in captivity.",videoCode: "XFYWazblaUA",still:"TheShapeOfWaterStill"),
    Movies(id: 3, name: "Signs", year: "2002", rating: "6.7", genre: "Horror/SciFi",image:"Signs",director:"M. Night Shyamalan",plot:"A family living on a farm finds mysterious crop circles in their fields which suggests something more frightening to come.",videoCode: "Lv4CJmFM",still:"SignsStill"),
    Movies(id: 4, name: "Fight Club", year: "1999", rating: "8.8", genre: "Drama", image: "FightClub",director:"David Fincher",plot:"An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soapmaker, forming an underground fight club that evolves into something much, much more.",videoCode: "SUXWAEX2jlg",still:"FightClubStill"),
    Movies(id: 5, name: "Amélie", year: "2001", rating: "8.3", genre: "Comedy/Romance", image: "Amelie",director:"Jean-Pierre Jeunet",plot:"Amélie is an innocent and naive girl in Paris with her own sense of justice. She decides to help those around her and, along the way, discovers love.",videoCode: "HUECWi5pX7o",still:"AmelieStill"),
    Movies(id: 5, name: "Valerie", year: "1970", rating: "7.2", genre: "Drama/Fantasy", image: "Valerie",director:"Jaromil Jires",plot:"Inspired by fairy-tales such as Alice in Wonderland and Little Red-Riding Hood, Valerie and her Week of Wonders is a surreal tale in which love, fear, sex and religion merge into one fantastic world.",videoCode: "mMntrQRCkOQ",still:"ValerieStill")
    
]


class StoriesTableViewController: UITableViewController {
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Movies"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        let movie = movies[indexPath.row]
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = "Genre: \(movie.genre)\nIMDB Rating: \(movie.rating)"
        cell.imageView?.image = UIImage(named: movie.image)
//        cell.backgroundColor = .black
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsTableViewController = segue.destination as? DetailedTableViewController{
            let indexPath = tableView.indexPathForSelectedRow
            detailsTableViewController.details = movies[(indexPath?.row)!]
        }
    }
    
    
    
}
