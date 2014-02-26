//
//  AppDelegate.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "AppDelegate.h"
#import "UserData.h"
#import "Dialog.h"
#import "FacebookSDK/FBAppCall.h"
#import "FacebookSDK/FBError.h"
#import "FacebookSDK/FBErrorUtility.h"
#import "FacebookSDK/FBRequestConnection.h"

@implementation AppDelegate

// Fonction appelée lorsque l'application a fini de se charger
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Si la session facebook est encore active, on l'ouvre avec les permissions basiques
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        [FBSession openActiveSessionWithReadPermissions:@[@"basic_info", @"email", @"user_birthday"] allowLoginUI:NO
                                      completionHandler:^(FBSession *session, FBSessionState state, NSError *error) {[self sessionStateChanged:session state:state error:error];}];
    }
    return YES;
}

// Fonction appelée lorsqu'on ouvre une URL dans l'application (comme le login facebook)
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
 
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

// Fonction appelée lorsque l'application reprend la main
- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppCall handleDidBecomeActive];
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

- (void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state error:(NSError *)error {
    /*
     Si la session a été ouverte
     On lance une requête à Facebook pour récupérer les données du compte
     On stocke les données de l'utilisateur
     */
    if (!error && state == FBSessionStateOpen) {
        NSLog(@"Session Facebook opened");
        UserData*   userData = [UserData getInstance];
        
        userData.connected = TRUE;
        userData.accountType = FACEBOOK;
        userData.profilePictureFB = [[FBProfilePictureView alloc] init];
        
        [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
            if (!error) {
                UserData*   userData = [UserData getInstance];
         
                userData.profilePictureFB.profileID = result[@"id"];
                userData.username = result[@"email"];
                userData.email = result[@"email"];
                userData.firstName = result[@"first_name"];
                userData.lastName = result[@"last_name"];
                userData.birthday = result[@"birthday"];
                userData.gender = result[@"gender"];
                userData.city = result[@"hometown"];
            }
            else
                NSLog(@"Error FBRequestConnection");
         }];
        
        return;
    }
    /*
     Si la session a été fermé
     On reset les données de l'utilisateur
     */
    if (state == FBSessionStateClosed || state == FBSessionStateClosedLoginFailed) {
        NSLog(@"Session Facebook closed");
        UserData*   userData = [UserData getInstance];
        
        userData.connected = FALSE;
        userData.accountType = EQUILIBRA;
        userData.profilePictureFB = nil;
        userData.username = @"";
        userData.email = @"";
        userData.firstName = @"";
        userData.lastName = @"";
        userData.birthday = @"";
        userData.gender = @"";
        userData.city = @"";
    }
    /*
     Si une erreur est survenue
     On l'identifie et on la signale dans une boite de dialogue
     Puis on ferme la session
     */
    if (error) {
        NSLog(@"Error");
        NSString *alertText;
        NSString *alertTitle;
        
        if ([FBErrorUtility shouldNotifyUserForError:error] == YES) {
            alertTitle = @"Something went wrong";
            alertText = [FBErrorUtility userMessageForError:error];
        }
        else {
            if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
                NSLog(@"User cancelled login");
            }
            else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession){
                alertTitle = @"Session Error";
                alertText = @"Your current session is no longer valid. Please log in again.";
            }
            else {
                NSDictionary *errorInformation = [[[error.userInfo objectForKey:@"com.facebook.sdk:ParsedJSONResponseKey"] objectForKey:@"body"] objectForKey:@"error"];
                
                alertTitle = @"Something went wrong";
                alertText = [NSString stringWithFormat:@"Please retry. \n\n If the problem persists contact us and mention this error code: %@", [errorInformation objectForKey:@"message"]];
            }
        }
        if (alertTitle.length != 0)
            [Dialog informDialog:alertTitle :alertText :nil];
        [FBSession.activeSession closeAndClearTokenInformation];
    }
}

@end
