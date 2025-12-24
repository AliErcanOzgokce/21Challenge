/// DAY 7: Unit Tests for Habit Tracker
///
/// Today (Done in main.move):
/// 1. Learnt how to write tests in Move
/// 2. Wrote tests for your habit tracker
/// 3. Used assert! macro


module challenge::day_07 {
    use std::vector;
    use std::string::{Self, String};

    // Copy from day_06: Habit struct with String
    public struct Habit has copy, drop {
        name: String,
        completed: bool,
    }

    public struct HabitList has drop {
        habits: vector<Habit>,
    }

    public fun new_habit(name: String): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    public fun make_habit(name_bytes: vector<u8>): Habit {
        let name = string::utf8(name_bytes);
        new_habit(name)
    }

    public fun empty_list(): HabitList {
        HabitList {
            habits: vector::empty(),
        }
    }

    public fun add_habit(list: &mut HabitList, habit: Habit) {
        vector::push_back(&mut list.habits, habit);
    }

    public fun complete_habit(list: &mut HabitList, index: u64) {
        let len = vector::length(&list.habits);
        if (index < len) {
            let habit = vector::borrow_mut(&mut list.habits, index);
            habit.completed = true;
        }
    }

    // Note: assert! is a built-in macro in Move 2024 - no import needed!
    // assert!(condition) - Check if condition is true (built-in macro) 
    // assert_eq!(value1, value2) - Check if two values are equal (from unit_test module)


    // Test: Create list and add habits
    #[test]
    fun test_add_habits() {
        let mut list = empty_list();
        // b"...".to_string() converts byte literals (b"...") to String
        // This is the standard way to create String values in Move
        let habit1 = new_habit(b"Exercise".to_string());
        let habit2 = new_habit(b"Read".to_string());
        
        add_habit(&mut list, habit1);
        add_habit(&mut list, habit2);
        
        let len = vector::length(&list.habits);
        assert!(len == 2, 0);
    }

    // Test: Complete a habit
    #[test]
    fun test_complete_habit() {
        let mut list = empty_list();
        let habit = new_habit(string::utf8(b"Exercise"));
        add_habit(&mut list, habit);
        
        complete_habit(&mut list, 0);
        
        let completed_habit = vector::borrow(&list.habits, 0);
        assert!(completed_habit.completed == true);
    }
}