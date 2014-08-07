#import "Shortcut.h"

@interface MASDictionaryTransformerTests : XCTestCase
@end

@implementation MASDictionaryTransformerTests

- (void) testErrorHandling
{
    MASDictionaryTransformer *transformer = [MASDictionaryTransformer new];
    XCTAssertNil([transformer transformedValue:nil],
        @"Decoding a shortcut from a nil dictionary returns nil.");
    XCTAssertNil([transformer transformedValue:(id)@"foo"],
        @"Decoding a shortcut from a invalid-type dictionary returns nil.");
    XCTAssertNil([transformer transformedValue:@{}],
        @"Decoding a shortcut from an empty dictionary returns nil.");
    XCTAssertNil([transformer transformedValue:@{@"keyCode":@"foo"}],
        @"Decoding a shortcut from a wrong-typed dictionary returns nil.");
    XCTAssertNil([transformer transformedValue:@{@"keyCode":@1}],
        @"Decoding a shortcut from an incomplete dictionary returns nil.");
    XCTAssertNil([transformer transformedValue:@{@"modifierFlags":@1}],
        @"Decoding a shortcut from an incomplete dictionary returns nil.");
}

@end
