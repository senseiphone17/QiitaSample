// https://qiita.com/lumbermill/items/6cd1c92909e7ae11a517

import UIKit

var jsonStr = "[{\"name\":\"John\",\"age\":37},{\"name\":\"Tim\"}]"

func jsonToDictionary(input: String) throws -> [[String : Any]] {

    guard let jsonData = jsonStr.data(using: String.Encoding.utf8) else { return [[String : Any]]() }
    
    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
    
    if let jsonDictionary: [[String : Any]] = jsonObject as? [[String : Any]] {
        return jsonDictionary
    }
    
    return [[String : Any]]()
}

do {
    let jsonDic = try jsonToDictionary(input: jsonStr)
    print(jsonDic) // [["name": John, "age": 37], ["name": Tim]]
} catch {
    print("error")
}
