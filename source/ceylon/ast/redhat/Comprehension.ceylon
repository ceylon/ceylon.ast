import ceylon.ast.core {
    Comprehension
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JComprehension=Comprehension
    }
}

"Converts a RedHat AST [[Comprehension|JComprehension]] to a `ceylon.ast` [[Comprehension]]."
shared Comprehension comprehensionToCeylon(JComprehension comprehension) {
    return Comprehension(initialComprehensionClauseToCeylon(comprehension.initialComprehensionClause));
}

"Compiles the given [[code]] for a Comprehension
 into a [[Comprehension]] using the Ceylon compiler
 (more specifically, the rule for a `comprehension`)."
shared Comprehension? compileComprehension(String code) {
    if (exists jComprehension = createParser(code).comprehension()) {
        return comprehensionToCeylon(jComprehension);
    } else {
        return null;
    }
}
