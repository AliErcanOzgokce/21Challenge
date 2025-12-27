/// DAY 4: Vector + Ownership Basics
/// 
/// Today (Done in main.move)
/// 1. Learn about vectors
/// 2. Created a list of habits
/// 3. Understand basic ownership concepts

module challenge::day_04 {
    use std::vector;
    use std::string::String;

    // Copy the Habit struct from day_03
    public struct Habit has copy, drop {
        name: String, /// Update it to use String instead of vector<u8>
        completed: bool,
    }


    /// Update it to use String (modern way - clearly indicates "this is text") instead of vector<u8>
    public fun new_habit(name: String): Habit {  
        Habit {
            name,
            completed: false,
        }
    }

    // HabitList struct containing a vector of habits
    public struct HabitList has drop {
        habits: vector<Habit>,
    }

    // Create an empty habit list
    public fun empty_list(): HabitList {
        HabitList {
            habits: vector::empty(),
        }
    }

    // Add a habit to the list (transfers ownership of habit)
    public fun add_habit(list: &mut HabitList, habit: Habit) {
        vector::push_back(&mut list.habits, habit);
    }
}