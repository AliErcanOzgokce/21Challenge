/// DAY 2: Primitive Types & Simple Functions
/// 
/// Today (Done in main.move)
/// 1. Practice with primitive types (u64, bool)
/// 2. Wrote my first function
/// 3. Wrote my first test

module challenge::day_02 {
    #[test_only]
    use std::unit_test::assert_eq;

    // In Move, functions: Have a name | Take parameters | Return values
    // Can be marked as public (callable from outside) or fun (private)
    // Functions can be tested with #[test]

    // Function that adds two u64 numbers | 
    public fun sum(a: u64, b: u64): u64 {
        a + b
    }
    // Note: In Move, the last expression is automatically returned (no return keyword needed)

    // Test that verifies sum(1, 2) == 3
    // assert_eq! has to be called with the exclamation mark because it's a macro 
    // macros are like functions but can do more complex things at compile time 
    #[test]
    fun test_sum() {
        let result = sum(1, 2);
        assert_eq!(result, 3);
    }
}