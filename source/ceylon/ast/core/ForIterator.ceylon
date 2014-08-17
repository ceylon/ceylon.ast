"An iterator for a ‘`for`’ loop, enclosed in parentheses.
 
 Examples:
 
     (person in people)
     (name->person in peopleByName)"
shared abstract class ForIterator()
        of ValueIterator | KeyValueIterator
        extends Node() {
    
    "The expression being iterated."
    shared formal Expression iterated;
}
