import ceylon.ast.core {
    PositionalArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPositionalArgumentList=PositionalArgumentList,
        JSequencedArgument=SequencedArgument
    }
}

"Converts a RedHat AST [[PositionalArgumentList|JPositionalArgumentList]] to a `ceylon.ast` [[PositionalArguments]]."
shared PositionalArguments positionalArgumentsToCeylon(JPositionalArgumentList positionalArguments) {
    /*
     I think the following excerpt from Ceylon.g explains the situation best:
     
         for (PositionalArgument pa: $sa.sequencedArgument.getPositionalArguments())
             $positionalArgumentList.addPositionalArgument(pa);
         //TODO: this is really nasty, PositionalArgumentList should have
         //      or be a SequencedArgument, not copy its PositionalArguments!
     */
    value sequencedArgument = JSequencedArgument(null);
    sequencedArgument.positionalArguments.addAll(positionalArguments.positionalArguments);
    /*
     note: ceylon-spec@e71c962 fixed a bug by replacing addAll with a manual loop + add,
     but as far as I can tell, the only difference that makes is that PositionalArgumentList.addPositionalArgument()
     connect()s the node. Since this doesn’t matter to us, I don’t think we have to worry about that.
     
     And remember, all that is “really nasty” in the first place :)
     */
    return PositionalArguments(argumentListToCeylon(sequencedArgument));
}

"Compiles the given [[code]] for a Positional Arguments
 into a [[PositionalArguments]] using the Ceylon compiler
 (more specifically, the rule for a `positionalArguments`)."
shared PositionalArguments? compilePositionalArguments(String code) {
    if (exists jPositionalArguments = createParser(code).positionalArguments()) {
        return positionalArgumentsToCeylon(jPositionalArguments);
    } else {
        return null;
    }
}
