import Foundation

/// A Nimble matcher that succeeds when the actual value is Void.
public func beVoid() -> Predicate<()> {
    return Predicate.defineNilable("be void") { actualExpression, message in
        let actualValue: ()? = try actualExpression.evaluate()
        let bool = actualValue != nil
        return PredicateResult(bool: bool, message: message)
    }
}

public func == (lhs: Expectation<()>, rhs: ()) {
    lhs.to(beVoid())
}

public func != (lhs: Expectation<()>, rhs: ()) {
    lhs.toNot(beVoid())
}
