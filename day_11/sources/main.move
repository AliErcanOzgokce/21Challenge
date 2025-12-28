/// DAY 11: TaskBoard & Address Type
/// 
/// Today (Done in main.move):
/// 1. Learnt about the address type
/// 2. Created a TaskBoard that tracks ownership
/// 3. Understand ownership in practice


module challenge::day_11 {
    use std::string::String;

    // Copy from day_10: TaskStatus enum and Task struct
    public enum TaskStatus has copy, drop {
        Open,
        Completed,
    }

    public struct Task has copy, drop {
        title: String,
        reward: u64,
        status: TaskStatus,
    }

    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            status: TaskStatus::Open,
        }
    }


    // TODO: Define a struct called 'TaskBoard' with:
    // - owner: address (the address that owns this board)
    // - tasks: vector<Task>  // Add 'drop' ability
    public struct TaskBoard has drop {
        owner: address,
        tasks: vector<Task>,
    }

    // TODO: Write a constructor 'new_board' that takes owner: address
    // and returns an empty TaskBoard
    public fun new_board(owner: address): TaskBoard {
    TaskBoard {
            owner,
            tasks: vector::empty(),
        }
    }

    // TODO: Write a function 'add_task' that:
    // - Takes board: &mut TaskBoard and task: Task
    // - Adds the task to the board's vector
    // The task becomes part of the board's data
    public fun add_task(board: &mut TaskBoard, task: Task) {
        vector::push_back(&mut board.tasks, task);
    }
}

