//
//  JokesViewModel.swift
//  uMotifProject
//
//  Created by Melvin Wijenayaka on 15/10/2020.
//

import Foundation

enum ExplictJokesState {
    case include
    case exclude
    
    mutating func flip() {
        switch self {
            case .include:
                self = .exclude
            case .exclude:
                self = .include
        }
    }
}

class JokesViewModel {
    
    private var jokes: [Joke]
    var apiClient: APIClient
    var explictJokesState: ExplictJokesState = .include
    
    init(with jokes: [Joke] = [], apiClient: APIClient) {
        self.jokes = jokes
        self.apiClient = apiClient
    }
    
    func clear() {
        jokes = []
    }
    
    
    
    func updateJokes(completion: @escaping () -> Void) {
        
        let randomJokes = JokesRequest.random(explictJokes: explictJokesState)
        
        apiClient.get(randomJokes) { result in
            
            switch result {
                case .success(let data):
                    do {
                        let root = try JSONParser.parse(data, type: JokeRoot.self)
                        self.jokes.append(contentsOf: root.value)
                       
                    } catch {
                        print(error)
                    }
                    
                case . failure(let error):
                    print(error)
            }
            print("self.jokes=\(self.jokes)")
            completion()
        }
    }
    
    func shouldPrefetch(given indexPaths: [IndexPath]) -> Bool {
        
        guard let last = indexPaths.last else {
            return false
        }
        
        return last.row + 1 >= numberOfObjects(inSection: last.section)
    }
    
}

extension JokesViewModel {
    
    var alertTitle: String {
        return String.alertTitle.default
    }
    
    var alertMessage: String {
        switch explictJokesState {
            case .exclude:
                return String.alertMessage.includeExplictJokes
            case .include:
                return String.alertMessage.excludeExplictJokes
        }
    }
    
    var confirmActionTitle: String {
        switch explictJokesState {
            case .exclude:
                return String.alertActionTitle.includeExplictJokes
            case .include:
                return String.alertActionTitle.excludeExplictJokes
        }
    }
    
}

extension JokesViewModel {
    
    var numberOfSections: Int {
        return jokes.isEmpty ? 0 : 1
    }
    
    func numberOfObjects(inSection section: Int) -> Int {
        
        guard section >= 0 && section < jokes.count else {
            return 0
        }
        
        return jokes.count
        
    }
    
    func object(at indexPath: IndexPath) -> Joke? {
        
        guard indexPath.row >= 0 && indexPath.row < numberOfObjects(inSection: indexPath.section) else {
            return nil
        }
        
        return jokes[indexPath.row]
    }
    
    func titleForObject(at indexPath: IndexPath) -> String? {
        
        guard let object = object(at: indexPath) else {
            return nil
        }
        
        return object.joke.replacingOccurrences(of: "&quot;", with: "\"")
    }
    
}
