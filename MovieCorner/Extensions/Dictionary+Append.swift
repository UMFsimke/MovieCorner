import Foundation

extension Dictionary {
    
    func append(key: Key, value: Value) -> [Key: Value] {
        var result = self
        result[key] = value
        return result
    }
    
}

