//
//  SHAWViewController.m
//  ShawVideoTool
//
//  Created by 14202183qq.com on 12/23/2021.
//  Copyright (c) 2021 14202183qq.com. All rights reserved.
//

#import "SHAWViewController.h"
#import "SHAWPlayViewController.h"
#import <ShawVideoTool/WAVideoBox.h>

@interface SHAWViewController ()
@property (nonatomic , strong) WAVideoBox *videoBox;
@end

@implementation SHAWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _videoBox = [WAVideoBox new];
}
- (IBAction)startWax:(id)sender {
    [_videoBox clean];
    NSString *filePath = [self buildFilePath];
    __weak typeof(self) wself = self;
    // http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4
    // http://mirror.aarnet.edu.au/pub/TED-talks/911Mothers_2010W-480p.mp4
    [_videoBox appendOnlineVideoByPath:@"https://qiniu.uishi.cn/c9130e9cf0281c1e5e59e8817fbff45b16b305601639029759"];
//    [_videoBox appendImages:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"gifTest" ofType:@"gif"]]  relativeRect:CGRectMake(0.6, 0.2, 0.3, 0)];
    [_videoBox appendWaterMark:[UIImage imageNamed:@"videoMrak"] relativeRect:CGRectMake(0.75, 0.1, 0.2, 0)];
    
    [_videoBox asyncFinishEditByFilePath:filePath progress:^(float progress) {
        NSLog(@"progress -- %f",progress);
        
    } complete:^(NSError *error) {
        if (!error) {
            [wself goToPlayVideoByFilePath:filePath];
        }
    }];
}

- (void)goToPlayVideoByFilePath:(NSString *)filePath{
    SHAWPlayViewController *playVc = [SHAWPlayViewController new];
    [playVc loadWithFilePath:filePath];
    [self.navigationController pushViewController:playVc animated:YES];
}
- (NSString *)buildFilePath{
    
    return [NSTemporaryDirectory() stringByAppendingString:[NSString stringWithFormat:@"%f.mp4", [[NSDate date] timeIntervalSinceReferenceDate]]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
