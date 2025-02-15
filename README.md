# Objective-C ARC Strong Reference Cycle Bug
This repository demonstrates a common error in Objective-C: strong reference cycles caused by blocks within ARC.  Incorrect handling of object ownership and block properties can lead to memory leaks that are difficult to detect.

## The Bug
The `bug.m` file contains an example of MyClass where a strong reference cycle is created between the class instance and a block within a method. This cycle prevents the objects from being deallocated, resulting in a memory leak.  The core problem is the implicit strong capture of `self` within the block.

## The Solution
The `bugSolution.m` file presents a corrected version that avoids the strong reference cycle.  A solution involves using `__weak` to break the cycle.  Additionally, proper usage of `copy` and `strong` for block properties is highlighted.