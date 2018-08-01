//
//  ViewController.m
//  TestIOS12Beta5UserAgent
//
//  Created by tepmnthar on 2018/8/1.
//  Copyright © 2018 Benqumark. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()
@property (nonatomic) WKWebView* webView;
@end

@implementation ViewController

- (WKWebView *)webView {
    if (!_webView) {
        _webView = ({
            WKWebViewConfiguration* configuration = [[WKWebViewConfiguration alloc] init];
            WKWebView* webView = [[WKWebView alloc] initWithFrame:self.view.bounds
                                                    configuration:configuration];
            [self.view addSubview:webView];
            webView;
        });
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.webView evaluateJavaScript:@"navigator.userAgent" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSString* originUserAgent = result;
        NSString* newUserAgent = [NSString stringWithFormat:@"%@ %@", originUserAgent, @"SOMETHING APPENDED"];
        self.webView.customUserAgent = newUserAgent;
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.bing.com"]]];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
