import ceylon.ast.core {
    Meta
}
import ceylon.ast.redhat {
    RedHatTransformer,
    metaToCeylon,
    compileMeta
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMetaLiteral=MetaLiteral
    }
}

shared object meta satisfies AbstractTest<Meta,JMetaLiteral> {
    compile = compileMeta;
    fromCeylon = RedHatTransformer.transformMeta;
    toCeylon = metaToCeylon;
    
    tests = [typeMeta, memberMeta];
}
