#import <UIKit/UIKit.h>

@interface VC : UIViewController
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) NSInteger count;
@end

@implementation VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.18 alpha:1];
    CGFloat w = self.view.bounds.size.width;

    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 140, w - 40, 80)];
    self.label.text = @"0";
    self.label.font = [UIFont boldSystemFontOfSize:64];
    self.label.textColor = UIColor.whiteColor;
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(40, 260, w - 80, 56);
    [btn setTitle:@"Bấm vào đây" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    btn.tintColor = UIColor.whiteColor;
    btn.backgroundColor = [UIColor colorWithRed:0.3 green:0.5 blue:1 alpha:1];
    btn.layer.cornerRadius = 14;
    [btn addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    UILabel *sl = [[UILabel alloc] initWithFrame:CGRectMake(40, 350, 200, 30)];
    sl.text = @"Đổi màu nền";
    sl.textColor = UIColor.whiteColor;
    [self.view addSubview:sl];

    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(40, 385, w - 80, 30)];
    slider.minimumValue = 0; slider.maximumValue = 1; slider.value = 0.6;
    [slider addTarget:self action:@selector(slide:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];

    UILabel *sw = [[UILabel alloc] initWithFrame:CGRectMake(40, 440, 200, 30)];
    sw.text = @"Chế độ vui";
    sw.textColor = UIColor.whiteColor;
    [self.view addSubview:sw];

    UISwitch *s = [[UISwitch alloc] initWithFrame:CGRectMake(w - 100, 438, 0, 0)];
    [s addTarget:self action:@selector(toggle:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:s];
}

- (void)tap {
    self.count++;
    self.label.text = [NSString stringWithFormat:@"%ld", (long)self.count];
    UIImpactFeedbackGenerator *g = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
    [g impactOccurred];
}

- (void)slide:(UISlider *)s {
    self.view.backgroundColor = [UIColor colorWithHue:s.value saturation:0.6 brightness:0.4 alpha:1];
}

- (void)toggle:(UISwitch *)s {
    self.label.text = s.on ? @"🎉" : [NSString stringWithFormat:@"%ld", (long)self.count];
}

@end

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow *window;
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)a didFinishLaunchingWithOptions:(NSDictionary *)o {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = [VC new];
    [self.window makeKeyAndVisible];
    return YES;
}
@end

int main(int argc, char *argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
