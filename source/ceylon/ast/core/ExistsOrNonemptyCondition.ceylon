"An existence or nonemptiness condition, that is,
 the keyword ‘`exists`’ or ‘`nonempty`’, followed by either
 a specified pattern or a member name referencing an existing value.
 
 Examples:
 
     nonempty [employeeOfTheMonth, *others] = randomShuffle(employees)
     exists String name = person.name"
shared abstract class ExistsOrNonemptyCondition()
        of ExistsCondition | NonemptyCondition
        extends Condition() {
    
    "The value reference or pattern specification being tested."
    shared formal SpecifiedPattern|LIdentifier tested;
    
    shared actual formal [SpecifiedPattern|LIdentifier] children;
}
