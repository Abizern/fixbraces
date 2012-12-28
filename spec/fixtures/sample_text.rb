# Sample texts ond expected results for testing

module SampleText
  INPUT=<<INPFB
#import "ViewController.h"

@interface ViewController {}

@end


@interface ViewController (AnotherCategory)
{}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        // A load of spurious conditionals to test formatting.

    if (nil)
    {
        NSLog(@"Nothing to see here");
    } else if (!nil)
    {
        NSLog(@"Nothing more to see here");
    } else
    {
        NSLog(@"We really shouldn't get to here");
    }

    for (NSInteger idx = 0; idx < 2; idx++)
    {
        NSLog(@"Print index");
    }

    NSUInteger anIndex= 0;
    while (anIndex)
    {
        NSLog(@"Increment anIndex");
        anIndex++;
    }

    switch (anIndex)
    {
        case 1:
        {
            NSLog(@"Switch in anIndex");
            break;
        }

        default:
            break;
    }

}

@end
INPFB

  EXPECTED =<<EXPFB
#import "ViewController.h"

@interface ViewController {}

@end


@interface ViewController (AnotherCategory) {}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        // A load of spurious conditionals to test formatting.

    if (nil) {
        NSLog(@"Nothing to see here");
    } else if (!nil) {
        NSLog(@"Nothing more to see here");
    } else {
        NSLog(@"We really shouldn't get to here");
    }

    for (NSInteger idx = 0; idx < 2; idx++) {
        NSLog(@"Print index");
    }

    NSUInteger anIndex= 0;
    while (anIndex) {
        NSLog(@"Increment anIndex");
        anIndex++;
    }

    switch (anIndex) {
        case 1: {
            NSLog(@"Switch in anIndex");
            break;
        }

        default:
            break;
    }

}

@end
EXPFB
end
