# Globals
Atoms = @Atoms =
  version   : "0.2.02"
  Core      : {}
  Class     : {}

  Atom      : {}
  Molecule  : {}
  Organism  : {}
  Template  : {}
  # DOM Handler Facade
  $: (args...) -> if $$? then $$ args... else $ args...