/// DAY 3: Structs (Habit Model Skeleton)
/// 
/// Today (Done in main.move)
/// 1. Learn about structs
/// 2. Created a Habit struct
/// 3. Wrote a constructor function

module challenge::day_03 {
    use std::vector;

    // A struct is a custom data type that groups related data together
    // Habit struct with name and completed status
    // Abilities tell Move what you can do with a type: copy, drop, store, key
    // Here, we want to be able to copy and drop Habits
    
   public struct Habit has copy, drop {
        name: vector<u8>,
        completed: bool,
    }

    // Constructor function to create a new habit
    public fun new_habit(name: vector<u8>): Habit {
        Habit {
            name,
            completed: false,
        }
    }
}
