//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Владислав Якунин on 24.12.2024.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocted")
    }
}

extension ResultViewController {
    private func updateResult() {
        var choiceOfAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            if let animalTypeCount = choiceOfAnimals[animal] {
                choiceOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                choiceOfAnimals[animal] = 1
            }
            
            let sortedChoiceOfAnimals = choiceOfAnimals.sorted { $0.value > $1.value }
            guard let mostChoiceAnimal = sortedChoiceOfAnimals.first?.key else { return }
            updateUI(with: mostChoiceAnimal)
        }
    }
    
    private func updateUI(with animal: Animal) {
        animalTypeLabel.text = "Вы - \(animal.rawValue)!"
        definitionLabel.text = animal.definition
    }
    
}
