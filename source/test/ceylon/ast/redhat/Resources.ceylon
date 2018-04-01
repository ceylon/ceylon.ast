import ceylon.ast.core {
    Resource,
    Resources
}
import ceylon.ast.redhat {
    RedHatTransformer,
    resourcesToCeylon,
    parseResources
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JResourceList=ResourceList
    }
}

shared object resources satisfies ConcreteTest<Resources,JResourceList> {
    
    String->Resources construct(<String->Resource>+ resources)
            => "(``",".join(resources*.key)``)" -> Resources(resources*.item);
    
    shared String->Resources oneResource = construct(resource.lockResource);
    shared String->Resources twoResources = construct(resource.lockResource, resource.writerResource);
    
    parse = parseResources;
    fromCeylon = RedHatTransformer.transformResources;
    toCeylon = resourcesToCeylon;
    codes = [oneResource, twoResources];
}
