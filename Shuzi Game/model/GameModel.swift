import Foundation

struct GameModel {
    var score: Int
    let maxTurns: Int
    var volume: Float
    var turns: Int
    var answer: Int
    var alternatives: [Int]
    var gameWon: Bool {
        turns >= maxTurns
    }
    var gameOver: Bool {
        score < 0 || gameWon
    }
    
    static var defaultGameModel: GameModel {
        .init(
            score: 0,
            maxTurns: 5,
            volume: 0.7,
            turns: 0,
            answer: 10,
            alternatives: [42, 13, 7, 10].shuffled()
        )
    }
    
    mutating func increaseScore() {
        score += 1
    }
    
    mutating func nextTurn() {
        turns += 1
    }
    
    //TODO: Need to implement
    mutating func generateNewProblem() {
        alternatives = Int.generateUniqueRandomInteger(count: 4)
        
        
        answer = alternatives[3]
        
        alternatives = alternatives.shuffled()
    }
    

}
