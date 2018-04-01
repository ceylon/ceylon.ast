import ceylon.ast.core {
    Meta
}
import ceylon.ast.redhat {
    RedHatTransformer,
    metaToCeylon,
    parseMeta
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JMetaLiteral=MetaLiteral
    }
}

shared object meta satisfies AbstractTest<Meta,JMetaLiteral> {
    parse = parseMeta;
    fromCeylon = RedHatTransformer.transformMeta;
    toCeylon = metaToCeylon;
    
    tests = [typeMeta, baseMeta, memberMeta];
}
