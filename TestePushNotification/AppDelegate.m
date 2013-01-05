//
//  AppDelegate.m
//  TestePushNotification
//
//  Created by Rafael Brigagão Paulino on 15/10/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate


//metodo acionado quando o aplicativo abre
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //perguntar para o usuario se ele deseja receber push notification
    //pedir para registrar o token do aparelho no servidor da apple
    [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    //=============================================================================================================
    
    //quando a plicacao estiver fechada e for aberta por um push notification, captamos o dicionario (dados) do push por aqui
    NSDictionary *pushInfo =[launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
     
    if (pushInfo != nil)
    {
        //se tiver alguma coisa dentro desse dicionario significa que o app foi aberto por um push notification
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Acordei por causa de push notification" message:[pushInfo description] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alerta show];
    }
    else
    {
        //abriu novamente
    }
            
    
    // Override point for customization after application launch.
    return YES;
}

//metodo acionado caso o usuario tenha aceitado receber PushNoticication e o seu token já estiver cadastrado no servidor da apple
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    //acessa un php do nosso servidor para salvar o token do usuario no nosso banco
    NSLog(@"Aceitou e já está registrado o token: %@", deviceToken);
}

//meotodo acionado quando o usuario aceita receber pn, porem o cadastro no servidor da apple falhou
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
   //aqui neste ponto pedimos paratentar registrar jnovamente o token do usuaario no banco da apple
    NSLog(@"falhou");
}


//metodo acionado quando recebemos um push notification e o nosso app estaaberto ou em background
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSLog(@"Recebi um push");
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}


///metodo acionado quando o app fica ativo e quando o app abre e quando o volta do background
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    //retirando a label vermelha do ícone do aparelho
    application.applicationIconBadgeNumber = 0;
    
    application.applicationIconBadgeNumber = application.applicationIconBadgeNumber+1;
    
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
