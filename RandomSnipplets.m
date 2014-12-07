//
//  RandomSnipplets.m
//  Random
//
//  Created by Rockstar. on 12/6/14.
//
//

#import "RandomSnipplets.h"

@implementation RandomSnipplets

//-----------------------
// Twitter Button using Fabric's TwitterKit
//-----------------------

/*
- (void)loginTwitter:(id)sender {
    //    GMHudView *hud = [[GMHudView alloc] initWithTitle:@"Signing in..." loading:YES];
    //    [hud show];
    [self hideButtons];
    [CircleLoading showHUDAddedTo:self.view withTitle:@"Loading..." animated:YES];
    [[Twitter sharedInstance] logInWithCompletion:^(TWTRSession *session, NSError *error) {
        if (session) {
            [[[Twitter sharedInstance] APIClient] loadUserWithID:[session userID] completion:^(TWTRUser *user, NSError *error) {
                if (user) {
                    //                    [hud completeAndDismissWithTitle:[NSString stringWithFormat:@"Welcome %@!", [user name]]];
                    [CircleLoading hideHUDFromView:self.view animated:YES];
                    ProfileViewController *viewController = [[ProfileViewController alloc] init];
                    NSString *imageString = [user profileImageLargeURL];
                    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageString]];
                    UIImage *image = [UIImage imageWithData:imageData];
                    [viewController.profileImage setImage:image];
                    [viewController.nameLabel setText:[user name]];
                    [viewController.navigationItem setTitle:[user name]];
                    [ProgressHUD showSuccess:[NSString stringWithFormat:@"Signed in as %@!", [user name]]];
                    
                    NSLog(@"New Session: %@", session);
                    AppDelegate *appDelegate = [AppDelegate sharedAppDelegate];
                    appDelegate.window.rootViewController = appDelegate.tabBarController;
                    [appDelegate.tabBarController setSelectedIndex:0];
                    [self performSelector:@selector(clearHUD) withObject:nil afterDelay:2];
                    
                } else {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"%@", [error localizedDescription]] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                    [alert show];
                }
            }];
            
        } else
        {
            //                [hud failAndDismissWithTitle:[NSString stringWithFormat:@"%@",error.localizedDescription]];
            [self showButtons];
            [CircleLoading hideHUDFromView:self.view animated:YES];
        }
    }];
}
*/
 
//-------------------------
// Twitter Button getting JSON for profile info
//-------------------------

/*
- (void)login {
    [self hideButtons];
    [CircleLoading showHUDAddedTo:self.view withTitle:@"Loading..." animated:YES];
    [[Twitter sharedInstance] logInWithCompletion:^(TWTRSession *session, NSError *error) {
        if (session) {
            [[[Twitter sharedInstance] APIClient] loadUserWithID:[session userID] completion:^(TWTRUser *user, NSError *error) {
                if (user) {
                    NSString *userString = @"https://api.twitter.com/1.1/users/show.json";
                    NSDictionary* params = @{@"screen_name" : [user screenName]};
                    NSError *error;
                    NSURLRequest *request = [[[Twitter sharedInstance] APIClient] URLRequestWithMethod:@"GET"
                                                                                                   URL:userString
                                                                                            parameters:params
                                                                                                 error:&error];
                    
                    if (request) {
                        [[[Twitter sharedInstance] APIClient] sendTwitterRequest:request completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                            
                            if (data) {
                                NSError *jsonError;
                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                                     options:0
                                                                                       error:&jsonError];
                                NSLog(@"%@", json);
                                
                                ProfileViewController *profile = [[ProfileViewController alloc] init];
                                
                                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                                    NSString *bannerURLStrong = [NSString stringWithFormat:@"%@/mobile_retina",[json objectForKey:@"profile_banner_url"]];
                                    
                                    NSString *profileImageURLString = [NSString stringWithFormat:@"%@",[json objectForKey:@"profile_image_url"]];
                                    profileImageURLString = [profileImageURLString stringByReplacingOccurrencesOfString:@"_normal" withString:@"_reasonably_small"];
                                    
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        NSURL *imgURL = [NSURL URLWithString:profileImageURLString];
                                        NSData *imgData = [NSData dataWithContentsOfURL:imgURL];
                                        profile.profileImage.image = [UIImage imageWithData:imgData];
                                        //                                        _profileImage.image = [UIImage imageWithData:imgData];
                                        
                                        NSURL *url = [NSURL URLWithString:bannerURLStrong];
                                        NSData *data = [NSData dataWithContentsOfURL:url];
                                        profile.bannerImage.image = [UIImage imageWithData:data];
                                        //                                        _bannerImage.image = [UIImage imageWithData:data];
                                        [profile.userNameLabel setText:[NSString stringWithFormat:@"@%@",[json objectForKey:@"screen_name"]]];
                                        [profile.aboutLabel setText:[json objectForKey:@"description"]];
                                        [profile.followersCount setText:[NSString stringWithFormat:@"%@",[json objectForKey:@"friends_count"]]];
                                        [profile.followingCount setText:[NSString stringWithFormat:@"%@",[json objectForKey:@"followers_count"]]];
                                        
                                        //                                        [_userNameLabel setText:[NSString stringWithFormat:@"@%@",[json objectForKey:@"screen_name"]]];
                                        
                                        //                                        [_aboutLabel setText:[json objectForKey:@"description"]];
                                        //                                        [_followingCount setText:[NSString stringWithFormat:@"%@",[json objectForKey:@"friends_count"]]];
                                        //                                        [_followersCount setText:[NSString stringWithFormat:@"%@",[json objectForKey:@"followers_count"]]];
                                    });
                                });
                            } else {
                                //Hanle Error
                            }
                        }];
                    } else {
                        //Handle error
                    }
                } else {
                    //Handle user error
                }
            }];
        } else {
            
        }
    }];
}
*/



@end
