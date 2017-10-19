// https://qiita.com/Iorin0225/items/48cdcdd7ab38a5cb8afa

class Fruit{
    func juice() {
        print("ジュースができました")
    }
}

// fruitはnil許容型のオブジェクトとする
var fruit: Fruit? = Fruit()

if let apple = fruit {
    apple.juice()
} else {
    print("There is no fruit...")
}
// とは、つまり、
if fruit != nil {
    let apple = fruit!
    apple.juice()
} else {
    print("There is no fruit...")
}

func juicer(fruit: Fruit?) {
    guard let apple = fruit else {
        print("There is no fruit...")
        return
    }
    
    apple.juice()
}

juicer(fruit: fruit)
juicer(fruit: nil)

