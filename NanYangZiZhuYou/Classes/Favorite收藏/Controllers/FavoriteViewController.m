//
//  FavoriteViewController.m
//  NanYangZiZhuYou
//
//  Created by scjy on 16/2/6.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import "FavoriteViewController.h"

@interface FavoriteViewController()<UIWebViewDelegate>
@property (nonatomic, weak) UIActivityIndicatorView *loadingView;


@end

@implementation FavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.webView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    [self.view addSubview:webView];
    // 隐藏scrollView
//    webView.scrollView.hidden = YES;
    // 伸缩页面至填充整个webView
    webView.scalesPageToFit = YES;
    [ProgressHUD show:@"加载中..."];
    
    // 2.加载网页
    //http://www.tudou.com/programs/view/N0Sl6n5tufU#
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.cncn.com/city/nanyang"]];
    [webView loadRequest:request];
    // 3.创建
//    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//    [loadingView startAnimating];
//    loadingView.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
//    [self.view addSubview:loadingView];
//    self.loadingView = loadingView;
}
#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [ProgressHUD dismiss];
    //列表
    //    NSMutableString *js1 = [NSMutableString string];
    //    [js1 appendString:@"var ul = document.getElementsByTagName('ul')[0];"];
    //    [js1 appendString:@"ul.parentNode.removeChild(ul);"];
    //    [webView stringByEvaluatingJavaScriptFromString:js1];
    //document.body.innerHTML
//    [webView stringByEvaluatingJavaScriptFromString:@"alert(恭喜你中奖了);"];
//    NSString *html = [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML;"];
//    fSLog(@"%@",html);
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        // 显示scrollView
//        webView.scrollView.hidden = NO;
//        
//        // 删除圈圈
//        [self.loadingView removeFromSuperview];
//    });
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error

{
    
    fSLog(@"error %@",error);
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [ProgressHUD dismiss];
    
    
}
@end
