/********* MP.m Cordova Plugin Implementation *******/

@import MercadoPagoSDK;
#import <Cordova/CDV.h>

@interface MP : CDVPlugin 

@property (nonatomic, retain) MercadoPagoCheckout * cho;

- (void) coolMethod:(CDVInvokedUrlCommand*)command;
- (void) createToken:(CDVInvokedUrlCommand*)command;
@end

@implementation MP

@synthesize cho;

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void) sendCallback:(NSString*)resultString callbackID:(NSString*)callbackID {
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:resultString];
    [self.commandDelegate sendPluginResult:result callbackId:callbackID];
}

- (void) sendErrorCallback:(NSString*)error errorCallbackID:(NSString*)errorCallbackID {
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_ERROR
                               messageAsString:error.description];
    [self.commandDelegate sendPluginResult:result callbackId:errorCallbackID];
}

@end
