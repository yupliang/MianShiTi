
#import "aa.h"
#import <objc/runtime.h>

@implementation Person

- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i=0; i<count; i++) {
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return false;
}
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return nil;
}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(study)) {
        NSMethodSignature *sig = [NSMethodSignature signatureWithObjCTypes:"v@:"];
        return sig;
    }
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    Student *student = [Student new];
    student->_name = @"小明";
    [anInvocation setSelector:@selector(play)];
    [anInvocation invokeWithTarget:student];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    unsigned int count = 0;
    Person *p = [Person new];
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i=0; i<count; i++) {
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
        [p setValue:[aDecoder decodeObjectForKey:key] forKey:key];
    }
    return p;
}

@end



@implementation Student

- (void)study {
    NSLog(@"%@ 学 runtime 中", self->_name);
}
- (void)play {
    NSLog(@"%@ 在玩耍，不想学习", _name);
}
@end
