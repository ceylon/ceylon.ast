import ceylon.ast.core {
    Artifact,
    LIdentifier,
    Module,
    ModuleSpecifier
}

"A collection of `String->ModuleSpecifier` items.
 
 Not a [[ConcreteTest]] because there’s no RedHat AST equivalent."
object moduleSpecifier {
    String->ModuleSpecifier construct(String->LIdentifier repository, String->Module name, <String->Artifact>? artifact = null)
    => "``repository.key``:``name.key```` if (exists artifact) then ":``artifact.key``" else "" ``" -> ModuleSpecifier(repository.item, name.item, artifact?.item);
    
    shared String->ModuleSpecifier orgHibernateCoreModuleSpecifier = construct(identifier.mavenLIdentifier, fullPackageName.orgHibernatePackageName, stringLiteral.hibernateCoreStringLiteral);
    shared String->ModuleSpecifier mavenCommonsCodecModuleSpecifier = construct(identifier.mavenLIdentifier, stringLiteral.commonsCodecStringLiteral, stringLiteral.commonsCodecStringLiteral);
}
