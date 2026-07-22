// Definition for a pair
// class Pair {
//     var key: Int
//     var value: String
//     init(_ key: Int, _ value: String) {
//         self.key = key
//         self.value = value
//     }
// }

class Solution {
    func mergeSort(_ pairs: inout [Pair]) -> [Pair] {
        mergeSort(&pairs, 0, pairs.count - 1)
        return pairs
    }

    private func merge(_ array: inout [Pair], _ l: Int, _ m: Int, _ r: Int) {
        var tempL: [Pair] = []
        var tempR: [Pair] = []
        for i in l...m {
            tempL.append(array[i])
        }
        for i in (m + 1)...r {
            tempR.append(array[i])
        }

        var L = 0
        var R = 0
        var K = l
        while L < tempL.count, R < tempR.count {
            if tempL[L].key <= tempR[R].key {
                array[K] = tempL[L]
                L += 1
            } else {
                array[K] = tempR[R]
                R += 1
            }
            K += 1
        }
        if L < tempL.count {
            for i in L..<tempL.count {
                array[K] = tempL[i]
                K += 1
            }
        }
        if R < tempR.count {
            for i in R..<tempR.count {
                array[K] = tempR[i]
                K += 1
            }
        }
    }

    private func mergeSort(_ array: inout [Pair], _ l: Int, _ r: Int) {
        guard r - l >= 1 else { return }

        let m = l + (r - l) / 2
        mergeSort(&array, l, m)
        mergeSort(&array, m + 1, r)

        merge(&array, l, m, r)
    }
}
