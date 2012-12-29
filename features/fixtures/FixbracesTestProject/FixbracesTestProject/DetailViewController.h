//
//  DetailViewController.h
//  FixbracesTestProject
//
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    NSString *_unusedStringIVar;
    NSArray *_unuasedArrayIVar;
}

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
