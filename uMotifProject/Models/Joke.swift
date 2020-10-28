//
//  Joke.swift
//  uMotifProject
//
//  Created by Melvin Wijenayaka on 15/10/2020.
//

import Foundation

struct Joke : Hashable, Codable, Equatable {
    let id :  Int
    let joke : String

}


struct JokeRoot: Codable {
    let type: String
    let value: [Joke]
}
