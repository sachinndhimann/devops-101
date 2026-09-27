# Perform a rolling deployment

## Implementation
Replace instances behind the load balancer one (or a few) at a time,
gated on each new instance passing `/ready` before the next is replaced
(chapter19/20).

## Validation
Confirm old and new versions briefly coexist without errors — this
validates your backward-compatibility work (chapter20).

## Production considerations
Never pair this with a breaking schema change in the same release —
use expand-and-contract instead (chapter20).
