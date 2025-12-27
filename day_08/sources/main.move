/// DAY 8: New Module & Simple Task Struct
/// 
/// Today (Done in main.move):
/// 1. Started a new project: Task Bounty Board
/// 2. Created a Task struct
/// 3. Wrote a constructor function

module challenge::day_08 {
    use std::string::String;

    // TODO: Define a struct called 'Task' with:
    // - title: String | - reward: u64 | - done: bool
    // Add 'copy' and 'drop' abilities

    // Task struct with title, reward, and completion status
    public struct Task has copy, drop {
        title: String,
        reward: u64,
        done: bool,
    }

    // TODO: Write a constructor function 'new_task'
    // that takes title and reward, returns a Task with done = false
    
    // Constructor function to create a new task
    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            done: false,
        }
    } 
}