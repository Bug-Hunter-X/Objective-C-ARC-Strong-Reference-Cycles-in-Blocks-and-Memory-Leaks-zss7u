To fix the strong reference cycle, use `__weak` to create a weak reference to `self` within the block:

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)doSomething {
    __weak MyClass *weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        MyClass *strongSelf = weakSelf;
        if (strongSelf) {
            strongSelf.myString = @"Hello";
            NSLog(@"String set in background: %@
", strongSelf.myString);
        }
    });
}
@end
```

By declaring `weakSelf`, we break the strong reference from the block to `self`. The `strongSelf` variable within the block ensures that the block only accesses `self` if it is still alive.   This pattern prevents the strong reference cycle, allowing the objects to be deallocated when appropriate.