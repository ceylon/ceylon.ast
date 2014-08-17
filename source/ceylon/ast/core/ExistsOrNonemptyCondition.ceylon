"An existence or nonemptiness condition, that is,
 the keyword ‘`exists`’ or ‘`nonempty`’, followed by either an
 (optionally typed) specified variable or an (untyped) member name.
 
 Examples:
 
     nonempty employees
     exists String name = person.name"
shared abstract class ExistsOrNonemptyCondition()
        of ExistsCondition | NonemptyCondition
        extends Condition() {
    
    "The variable being tested."
    shared formal SpecifiedVariable|LIdentifier variable;
    
    shared actual formal [SpecifiedVariable|LIdentifier] children;
}
