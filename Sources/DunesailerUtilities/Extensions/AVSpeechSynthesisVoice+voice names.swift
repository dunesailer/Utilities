//  Created by B.T. Franklin on 1/1/18.

#if canImport(AVFoundation)

import AVFoundation

extension AVSpeechSynthesisVoice {
    
    private static let maleVoiceNames = [
        "Alex",
        "Maged",
        "Fred",
        "Tom",
        "Lee",
        "Daniel",
        "Oliver",
        "Magnus",
        "Onni",
        "Thomas",
        "Nicholas",
        "Markus",
        "Yannick",
        "Nikos",
        "Neel",
        "Xander",
        "Luca",
        "Otoya",
        "Henrik",
        "Krzysztof",
        "Felipe",
        "Joaquim",
        "Yuri",
        "Cem",
        "Juan",
        "Oskar",
        "Jorge"
    ]
    
    private static let femaleVoiceNames = [
        "Allison",
        "Ava",
        "Susan",
        "Victoria",
        "Nicky",
        "Kate",
        "Serena",
        "Zuzana",
        "Iveta",
        "Sara",
        "Satu",
        "Anna",
        "Melina",
        "Karen",
        "Moira",
        "Samantha",
        "Tessa",
        "Carmit",
        "Damayanti",
        "Amelie",
        "Amélie",
        "Chantal",
        "Audrey",
        "Aurelie",
        "Lekha",
        "Mariska",
        "Alice",
        "Federica",
        "Kyoko",
        "Yuna",
        "Sora",
        "Ellen",
        "Claire",
        "Nora",
        "Zosia",
        "Ewa",
        "Luciana",
        "Joana",
        "Catarina",
        "Ioana",
        "Milena",
        "Katya",
        "Laura",
        "Monica",
        "Mónica",
        "Paulina",
        "Angelica",
        "Marisol",
        "Kanya",
        "Narisa",
        "Alva",
        "Klara",
        "Yelda",
        "Tian-Tian",
        "Ting-Ting",
        "Sin-Ji",
        "Mei-Jia"
    ]
    
    public enum Gender {
        case male
        case female
        case unknown
    }
    
    public var gender: Gender {
        let gender: Gender
        
        let simplifiedName = String(describing: name.split(separator: " ", maxSplits: 0).first!)
        if AVSpeechSynthesisVoice.maleVoiceNames.contains(simplifiedName) {
            gender = .male
        } else if AVSpeechSynthesisVoice.femaleVoiceNames.contains(simplifiedName) {
            gender = .female
        } else {
            gender = .unknown
        }
        
        return gender
    }
    
}

#endif

