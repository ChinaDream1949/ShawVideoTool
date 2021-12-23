//
//  SHAWPlayViewController.m
//  ShawVideoTool_Example
//
//  Created by hsapple on 2021/12/23.
//  Copyright © 2021 14202183qq.com. All rights reserved.
//

#import "SHAWPlayViewController.h"
#import <AVKit/AVKit.h>

@interface SHAWPlayViewController ()
@property(nonatomic,strong) AVPlayerViewController *playerController;
@property (nonatomic , strong) NSString *filePath;
@end

@implementation SHAWPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _playerController = [[AVPlayerViewController alloc] init];
    NSURL * url = [NSURL fileURLWithPath:self.filePath];
    _playerController.player = [AVPlayer playerWithURL:url];
    _playerController.view.frame = self.view.bounds;
    _playerController.showsPlaybackControls = YES;
  
    [self.view addSubview:_playerController.view];
 
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[_playerController player] play];
}

- (void)loadWithFilePath:(NSString *)filePath{
    self.filePath = filePath;
}


@end
