import Foundation

protocol Day {
    var label : String { get }
    var input : String { get }
    func taskZeroLogic() -> String
    func taskOneLogic() -> String
}


extension Day {
    func execute(task taskLogic: () -> String, withLabel tasklabel: String)
    {
        var answer = ""
        let timeInMillis = stopTimeWhileExecuting(task: { answer = taskLogic() })
        print("Answer \(tasklabel) =")
        print(answer)
        print("(The task took \(timeInMillis) s)")
        print()
    }

    func taskZeroExecution() { execute(task: taskZeroLogic, withLabel: "Zero") }
    func taskOneExecution() { execute(task: taskOneLogic, withLabel: "One") }

    func executeWholeDay() {
        print()
        print("Day \(label)")
        print()
        print("Input =")
        print(input)
        print()
        let timeInMillis = stopTimeWhileExecuting(task: { 
            taskZeroExecution()
            taskOneExecution()
        })
        print("(The day \(label) took \(timeInMillis) s in total)")
    }

    func stopTimeWhileExecuting(task taskLogic: () -> ()) -> TimeInterval {
        let methodStart = Date()
        taskLogic()
        let methodFinish = Date()
        return methodFinish.timeIntervalSince(methodStart)
    }
}