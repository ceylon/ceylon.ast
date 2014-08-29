import ceylon.ast.core {
    ArgumentList,
    Expression,
    Invocation,
    LIdentifier,
    PositionalArguments,
    Resource,
    SpecifiedVariable,
    Specifier,
    qualifiedExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    resourceToCeylon,
    compileResource
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JResource=Resource
    }
}

shared object resource satisfies ConcreteTest<Resource,JResource> {
    
    String->Resource construct(String->Expression|SpecifiedVariable resource)
            => "``resource.key``"->Resource(resource.item);
    
    shared String->Resource lockResource = construct(baseExpression.lockExpression);
    shared String->Resource writerResource = construct("writer = file.Writer()"->SpecifiedVariable {
            name = LIdentifier("writer");
            specifier = Specifier(Invocation(qualifiedExpression("file", "Writer"), PositionalArguments(ArgumentList())));
        });
    
    compile = compileResource;
    fromCeylon = RedHatTransformer.transformResource;
    toCeylon = resourceToCeylon;
    codes = [lockResource, writerResource];
}
