//
//  PlantModel.swift
//  BeeMyGarden
//
//  Created by Falah Rasyidi on 15/7/2025.
//

struct Plant {
    let plantName: String
    let plantFile: String
    let plantDescription: String
}

let plantChoices: [Plant] = [
    Plant(plantName: "Echinacea",
          plantFile: "Echinacea.usdz",
          plantDescription: "Echinacea is a genus of herbaceous flowering plants in the daisy family. It has ten species, which are commonly called coneflowers. They are native only in eastern and central North America, where they grow in wet to dry prairies and open wooded areas."),
    Plant(plantName: "Potted plant",
          plantFile: "Indoor Plant.usdz",
          plantDescription: "Potted plant is a type of plant that is grown in a pot, rather than in the ground."),
    Plant(plantName: "Tropical plant",
          plantFile: "Tropical Plant.usdz",
          plantDescription: "Tropical plant is a type of plant that is native to the tropics, which is a region of the Earth that is generally warm and humid.")
]
