// https://qiita.com/hikaruna/items/7d2e919be0bc93bf3f45

import UIKit

private protocol MarioStateBehavior {
    var name: String { get }
    func hitEnemy()
}

class Mario {
    
    var state: State = .normal
    
    var name: String {
        return "\(state.name)マリオ"
    }
    
    func hitEnemy() {
        state.hitEnemy()
        
        switch state {
        case .normal, .star:
            break
        case .big, .fire:
            state = .normal
        }
    }
    
    enum State: MarioStateBehavior {
        case normal
        case big
        case fire
        case star
        
        private static let states: [State: MarioStateBehavior] = [
            .normal: Normal(),
            .big: Big(),
            .fire: Fire(),
            .star: Star()
        ]
        
        private var behavior: MarioStateBehavior {
            return State.states[self]!
        }
        
        var name: String {
            return behavior.name
        }
        
        func hitEnemy() {
            behavior.hitEnemy()
        }
        
        private class Normal: MarioStateBehavior {
            let name = "チビ"
            
            func hitEnemy() {
                print("死ぬ")
            }
        }
        
        private class Big: MarioStateBehavior {
            let name = "スーパー"
            
            func hitEnemy() {
                print("チビマリオになる")
            }
        }
        
        private class Fire: MarioStateBehavior {
            let name = "ファイアー"
            
            func hitEnemy() {
                print("チビマリオになる")
            }
        }
        
        private class Star: MarioStateBehavior {
            let name = "無敵"
            
            func hitEnemy() {
                print("敵を倒す")
            }
        }
    }
}

let mario = Mario()

mario.name // チビマリオ
mario.hitEnemy()

mario.state = .big
mario.name // スーパーマリオ
mario.hitEnemy()
mario.name // チビマリオ

mario.state = .star
mario.hitEnemy()
mario.name // 無敵マリオ
