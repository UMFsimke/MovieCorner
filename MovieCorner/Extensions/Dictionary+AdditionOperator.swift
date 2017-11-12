import Foundation

func + <K,V>(left: Dictionary<K,V>, right: Dictionary<K,V>) -> Dictionary<K,V> {
    return right.reduce(left, { (result, element) -> Dictionary<K,V> in
        return result.append(key: element.key, value: element.value)
    })
}

