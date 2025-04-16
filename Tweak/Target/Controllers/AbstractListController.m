//
//  AbstractListController.m
//  Vē
//
//  Created by Alexandra Aurora Göttlicher
//

#import "AbstractListController.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import "Views/BiometricProtectionOverlayView.h"

@implementation AbstractListController
- (void)viewDidLoad {
    [super viewDidLoad];
}
/**
 * Performs a biometric protection check and applies the filter button when the app entered the foreground.
 *
 * @param notification
 */
- (void)applicationDidBecomeActive:(NSNotification *)notification {
}

/**
 * Performs a biometric protection check.
 *
 * If access granted, the biometric protection overlay view will be hidden.
 * Else, it'll pop the controller.
 */
- (void)checkBiometrics {
    LAContext* laContext = [[LAContext alloc] init];
    [laContext evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"Vē needs to make sure you're permitted to view the notification logs." reply:^(BOOL success, NSError* _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (success) {
                [self hideBiometricProtectionOverlay];
            } else {
                [[self navigationController] popViewControllerAnimated:YES];
            }
        });
    }];
}

/**
 * Shows the biometric protection overlay.
 */
- (void)showBiometricProtectionOverlay {
    [[self biometricProtectionOverlayView] setHidden:NO];
}

/**
 * Hides the biometric protection overlay.
 */
- (void)hideBiometricProtectionOverlay {
    [[self biometricProtectionOverlayView] setHidden:YES];
}
@end
