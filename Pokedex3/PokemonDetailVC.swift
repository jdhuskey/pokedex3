//
//  PokemonDetailVC.swift
//  Pokedex3
//
//  Created by Jeffrey D Huskey on 10/24/16.
//  Copyright © 2016 FavoredFruit. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var evoLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name.capitalized
        
        let image = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImage.image = image
        
        currentEvoImage.image = image
        
        pokedexLabel.text = "\(pokemon.pokedexId)"
            
        pokemon.downloadPokemonDetails {
            
            //Whatever we write here will only be executed after the network call is complete!
            
            self.updateUI()
            
        }
        
    }
    
    func updateUI() {
        
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        typeLabel.text = pokemon.type
        descriptionLabel.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            
            evoLabel.text = "No Evolutions"
            nextEvoImage.isHidden = true
            
        } else {
            
            nextEvoImage.isHidden = false
            nextEvoImage.image = UIImage(named: "\(pokemon.nextEvolutionId)")
            let string = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLabel.text = string
            
        }
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    

}
