/// DAY 6: String Type for Habit Names
/// 
/// /// /// Today (Done in main.move):
/// 1. Learnt about the String type
/// 2. Converted vector<u8> to String
/// 3. Updated Habit to use String instead of vector<u8>

module challenge::day_06 {
    use std::vector;
    use std::string::{Self, String};

    // Copy from day_05: Habit struct (will be updated to use String)
    public struct Habit has copy, drop {
        name: String,  // Changed vector<u8> to String
        completed: bool,
    }

    // Constructor that accepts String
    public fun new_habit(name: String): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    // Helper function to create a habit from bytes
    public fun make_habit(name_bytes: vector<u8>): Habit {
        let name = string::utf8(name_bytes);
        new_habit(name)
    }
}