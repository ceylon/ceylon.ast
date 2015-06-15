import ceylon.ast.core {
    Node,
    PositionalArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JPositionalArgumentList=PositionalArgumentList,
        JSequencedArgument=SequencedArgument
    }
}

"Converts a RedHat AST [[PositionalArgumentList|JPositionalArgumentList]] to a `ceylon.ast` [[PositionalArguments]]."
shared PositionalArguments positionalArgumentsToCeylon(JPositionalArgumentList positionalArguments, Anything(JNode,Node) update = noop) {
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
    value result = PositionalArguments(argumentListToCeylon(sequencedArgument, update));
    update(positionalArguments, result);
    return result;
}

"Compiles the given [[code]] for Positional Arguments
 into [[PositionalArguments]] using the Ceylon compiler
 (more specifically, the rule for `positionalArguments`)."
shared PositionalArguments? compilePositionalArguments(String code, Anything(JNode,Node) update = noop) {
    if (exists jPositionalArguments = createParser(code).positionalArguments()) {
        return positionalArgumentsToCeylon(jPositionalArguments, update);
    } else {
        return null;
    }
}
