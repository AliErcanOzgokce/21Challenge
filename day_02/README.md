# Day 2: Primitive Types & Simple Functions

## What You'll Learn Today

Today you'll learn:
- How to write functions in Move
- How to use primitive types (u64) in functions
- How to write your first test

## Understanding Functions

A **function** is a block of code that performs a specific task. In Move, functions:
- Have a name
- Can take parameters (inputs)
- Can return a value
- Can be marked as `public` (callable from outside) or `fun` (private)

Basic function syntax:
```move
public fun function_name(param1: Type1, param2: Type2): ReturnType {
    // code here
    return_value
}
```

Note: In Move, the last expression is automatically returned (no `return` keyword needed).

## Understanding Tests

Tests in Move are functions marked with `#[test]`. They:
- Run when you execute `sui move test`
- Help verify your code works correctly
- Use assertions to check expected values

Basic test syntax:
``` move
fun test_name() {
    assert_eq!(1 + 1, 2)
}
```

`assert_eq!` has to be called with the exclamation mark because it's a macro rather than a function. If you don't know what is macro, you can think that it's cooler function. It copy-pasted the actual code instead of calling the function.

Note: In Move, you have to import the `assert_eq` from `std::unit_test` inside your module to use it. You can do it like:
``` move
#[test_only]
use std::unit_test::assert_eq;
```

The good people tend to use `#[test_only]` to not pollute scope with test related things to speed up compiler performance. Also, it's good to declare it's not related with actual code.

## Your Task

1. Open `sources/main.move`
2. Write a `sum` function that adds two u64 numbers
3. Write a test that verifies `sum(1, 2) == 3`

## Reading Materials

1. **Primitive Types** - Review basic types:
   [https://move-book.com/move-basics/primitive-types/](https://move-book.com/move-basics/primitive-types/)

2. **Functions** - Learn function syntax and usage:
   [https://move-book.com/move-basics/function/](https://move-book.com/move-basics/function/)

3. **Testing** - Learn testing fundamentals:
   [https://move-book.com/move-basics/testing/](https://move-book.com/move-basics/testing/)

## Commit

```bash
cd day_02
sui move test
git add day_02/
git commit -m "Day 2: practice primitive types and functions"
```