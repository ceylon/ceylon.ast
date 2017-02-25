import ceylon.ast.core {
    Expression,
    Invocation,
    LIdentifier,
    Resource,
    SpecifiedVariable,
    Specifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    resourceToCeylon,
    parseResource
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JResource=Resource
    }
}
import ceylon.ast.create {
    qualifiedExpression
}

shared object resource satisfies ConcreteTest<Resource,JResource> {
    
    String->Resource construct(String->Expression|SpecifiedVariable resource)
            => "``resource.key``" -> Resource(resource.item);
    
    shared String->Resource lockResource = construct(baseExpression.lockExpression);
    shared String->Resource writerResource = construct("writer = file.Writer()" -> SpecifiedVariable {
            name = LIdentifier("writer");
            specifier = Specifier(Invocation(qualifiedExpression("file", "Writer")));
        });
    
    parse = parseResource;
    fromCeylon = RedHatTransformer.transformResource;
    toCeylon = resourceToCeylon;
    codes = [lockResource, writerResource];
}
