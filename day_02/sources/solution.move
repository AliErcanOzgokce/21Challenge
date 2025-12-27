/// DAY 2: Primitive Types & Simple Functions - SOLUTION
/// 
/// This is the solution file for day 2.
/// Students should complete main.move, not this file.
/// 
/// To test this solution, temporarily rename main.move and use this file.

module challenge::day_02_solution {
    #[test_only]
    use std::unit_test::assert_eq;

    // Function that adds two u64 numbers
    public fun sum(a: u64, b: u64): u64 {
        a + b
    }

    // Test that verifies sum(1, 2) == 3
    #[test]
    fun test_sum() {
        let result = sum(1, 2);
        assert_eq!(result, 3);
    }
}