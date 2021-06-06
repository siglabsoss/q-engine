South complex of Q-Engine.

Everything including Vector memory and South.

## Build

```sh
npm i
make
```

## Hierarchy

```
piston
  |
  +-- vector_logic (vector_logic)
  |     |
  |     +-- vector_slice (x0..x31)
  |
  +-- inmux (inmux)
  |
  +-- permutator (perm0)
  |     |
  |     +-- permutator_slice (u0..u31)
  |
  +-- vmem (vmem)
  |     |
  |     +-- memory_slice (u0..u31)
  |
  +-- permutator (perm1)
  |     |
  |     +-- permutator_slice (u0..u31)
  |
  +-- oumux (oumux)
  |
  +-- rdp_systolic (rdp_systolic)
```
