import ceylon.language {
    langNoop=noop
}

"Value that stores the noop function.
 Referencing this value is equivalent to referencing the original function,
 but since this is a value and not a function,
 the backend does not have to generate a new `AbstractCallable` for each reference.
 Since virtually every function in this module has a parameter with default argument `noop`,
 this trick **drastically** reduces code size –
 as of this writing, from 2.2 MiB down to 1.3 MiB."
Anything(Anything*) noop = langNoop;
