//
//  String.swift
//  uMotifProject
//
//  Created by Melvin Wijenayaka on 21/10/2020.
//

import Foundation

extension String {
    
    enum alertTitle {
        static let `default` = "Explict Jokes Filter"
    }
    
    enum alertMessage {
        static let includeExplictJokes = "Currently explict jokes are not being displayed, do you want to include them?"
        static let excludeExplictJokes = "Explict jokes currently are being displayed, do you want to exclude them?"
    }
    
    enum alertActionTitle {
        static let includeExplictJokes = "Include Them"
        static let excludeExplictJokes = "Exclude Them"
    }
    
}
