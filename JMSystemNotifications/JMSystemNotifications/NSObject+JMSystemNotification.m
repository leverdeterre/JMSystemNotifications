//
//  NSObject+JMSystemNotification.m
//  JMSystemNotifications
//
//  Created by jerome morissard on 04/04/2015.
//  Copyright (c) 2015 Jérôme Morissard. All rights reserved.
//

#import "NSObject+JMSystemNotification.h"
#import "NSError+JMSystemNotification.h"
#import <objc/runtime.h>

#import <UIKit/NSTextStorage.h>
#import <UIKit/UIWindow.h>
#import <UIKit/UIAccessibility.h>
#import <UIKit/UIApplication.h>
#import <UIKit/UIDocument.h>
#import <UIKit/UIMenuController.h>
#import <UIKit/UIPasteboard.h>
#import <UIKit/UIScreen.h>
#import <UIKit/UITextView.h>
#import <UIKit/UIViewController.h>

#import <CoreData/NSManagedObjectContext.h>
#import <CoreData/NSPersistentStoreCoordinator.h>

#import <AssetsLibrary/ALAssetsLibrary.h>

#import <Accounts/ACAccountStore.h>

#import <PassKit/PKPassLibrary.h>

#import <EventKit/EKEventStore.h>

#import <MessageUI/MFMessageComposeViewController.h>

static char kObservedNotificationNamesKey;

NSString * JMSystemNotificationName(JMSystemNotification num)
{
    switch (num) {
        //<UIKit/NSTextStorage.h>
        case JMTextStorageWillProcessEditingNotification:
            ReturnNSStringIfExistAtAddress(NSTextStorageWillProcessEditingNotification);
            
        case JMTextStorageDidProcessEditingNotification:
            ReturnNSStringIfExistAtAddress(NSTextStorageDidProcessEditingNotification);
            
        //<UIKit/UIWindow.h>
        case JMWindowDidBecomeVisibleNotification:          return UIWindowDidBecomeVisibleNotification;
        case JMWindowDidBecomeHiddenNotification:           return UIWindowDidBecomeHiddenNotification;
        case JMWindowDidBecomeKeyNotification:              return UIWindowDidBecomeKeyNotification;
        case JMWindowDidResignKeyNotification:              return UIWindowDidResignKeyNotification;
        case JMKeyboardWillShowNotification:                return UIKeyboardWillShowNotification;
        case JMKeyboardDidShowNotification:                 return UIKeyboardDidShowNotification;
        case JMKeyboardWillHideNotification:                return UIKeyboardWillHideNotification;
        case JMKeyboardDidHideNotification:                 return UIKeyboardDidHideNotification;
        case JMKeyboardWillChangeFrameNotification:         return UIKeyboardWillChangeFrameNotification;
        case JMKeyboardDidChangeFrameNotification:          return UIKeyboardDidChangeFrameNotification;
            
        //<UIKit/UITextField.h>
        case JMTextFieldTextDidBeginEditingNotification:    return UITextFieldTextDidBeginEditingNotification;
        case JMTextFieldTextDidEndEditingNotification:      return UITextFieldTextDidEndEditingNotification;
        case JMTextFieldTextDidChangeNotification:          return UITextFieldTextDidChangeNotification;
            
        //<UIKit/UIAccessibilityConstants.h>
        //<UIKit/UIAccessibility.h>
        //case JMAccessibilityPostNotification:                         return UIAccessibilityPostNotification;
        case JMAccessibilityMonoAudioStatusDidChangeNotification:
            ReturnNSStringIfExistAtAddress(UIAccessibilityMonoAudioStatusDidChangeNotification); //5_0
            
        case JMAccessibilityClosedCaptioningStatusDidChangeNotification:
            ReturnNSStringIfExistAtAddress(UIAccessibilityClosedCaptioningStatusDidChangeNotification); //5_0
            
        case JMAccessibilityInvertColorsStatusDidChangeNotification:
            ReturnNSStringIfExistAtAddress(UIAccessibilityInvertColorsStatusDidChangeNotification); //6_0
            
        case JMAccessibilityGuidedAccessStatusDidChangeNotification:
            ReturnNSStringIfExistAtAddress(UIAccessibilityGuidedAccessStatusDidChangeNotification); //6_0
            
        case JMAccessibilityBoldTextStatusDidChangeNotification:
            ReturnNSStringIfExistAtAddress(UIAccessibilityBoldTextStatusDidChangeNotification); //8_0
            
        case JMAccessibilityGrayscaleStatusDidChangeNotification:
            ReturnNSStringIfExistAtAddress(UIAccessibilityGrayscaleStatusDidChangeNotification); //8_0
            
        case JMAccessibilityReduceTransparencyStatusDidChangeNotification:
            ReturnNSStringIfExistAtAddress(UIAccessibilityReduceTransparencyStatusDidChangeNotification); //8_0
            
        case JMAccessibilityReduceMotionStatusDidChangeNotification:
            ReturnNSStringIfExistAtAddress(UIAccessibilityReduceMotionStatusDidChangeNotification); //8_0
            
        case JMAccessibilityDarkerSystemColorsStatusDidChangeNotification:
            ReturnNSStringIfExistAtAddress(UIAccessibilityDarkerSystemColorsStatusDidChangeNotification); //8_0
            
        case JMAccessibilitySwitchControlStatusDidChangeNotification:
            ReturnNSStringIfExistAtAddress(UIAccessibilitySwitchControlStatusDidChangeNotification); //8_0
            
        case JMAccessibilitySpeakSelectionStatusDidChangeNotification:
            ReturnNSStringIfExistAtAddress(UIAccessibilitySpeakSelectionStatusDidChangeNotification); //8_0
            
        case JMAccessibilitySpeakScreenStatusDidChangeNotification:
            ReturnNSStringIfExistAtAddress(UIAccessibilitySpeakScreenStatusDidChangeNotification); //8_0
            
            //case JMAccessibilityScreenChangedNotification:   return UIAccessibilityScreenChangedNotification;
            //case JMAccessibilityLayoutChangedNotification:   return UIAccessibilityLayoutChangedNotification;
            //case JMAccessibilityAnnouncementNotification:   return UIAccessibilityAnnouncementNotification;
            //case JMAccessibilityAnnouncementDidFinishNotification:   return UIAccessibilityAnnouncementDidFinishNotification;
            //case JMAccessibilityPageScrolledNotification:   return UIAccessibilityPageScrolledNotification;
            //case JMAccessibilityPauseAssistiveTechnologyNotification:   return UIAccessibilityPauseAssistiveTechnologyNotification; //8_0
            //case JMAccessibilityResumeAssistiveTechnologyNotification:   return UIAccessibilityResumeAssistiveTechnologyNotification; //8_0
        case JMAccessibilityNotificationSwitchControlIdentifier:
            ReturnNSStringIfExistAtAddress(UIAccessibilityNotificationSwitchControlIdentifier); //8_0
            
            
        //<UIKit/UIApplication.h>
        case JMApplicationDidEnterBackgroundNotification:                   return UIApplicationDidEnterBackgroundNotification; //4_0
        case JMApplicationWillEnterForegroundNotification:                  return UIApplicationWillEnterForegroundNotification; //4_0
        case JMApplicationDidFinishLaunchingNotification:                   return UIApplicationDidFinishLaunchingNotification;
        case JMApplicationDidBecomeActiveNotification:                      return UIApplicationDidBecomeActiveNotification;
        case JMApplicationWillResignActiveNotification:                     return UIApplicationWillResignActiveNotification;
        case JMApplicationDidReceiveMemoryWarningNotification:              return UIApplicationDidReceiveMemoryWarningNotification;
        case JMApplicationWillTerminateNotification:                        return UIApplicationWillTerminateNotification;
        case JMApplicationSignificantTimeChangeNotification:                return UIApplicationSignificantTimeChangeNotification;
        case JMApplicationWillChangeStatusBarOrientationNotification:       return UIApplicationWillChangeStatusBarOrientationNotification;
        case JMApplicationDidChangeStatusBarOrientationNotification:        return UIApplicationDidChangeStatusBarOrientationNotification;
        case JMApplicationWillChangeStatusBarFrameNotification:             return UIApplicationWillChangeStatusBarFrameNotification;
        case JMApplicationDidChangeStatusBarFrameNotification:              return UIApplicationDidChangeStatusBarFrameNotification;
        case JMApplicationBackgroundRefreshStatusDidChangeNotification:     return UIApplicationBackgroundRefreshStatusDidChangeNotification;
        case JMContentSizeCategoryDidChangeNotification:
            ReturnNSStringIfExistAtAddress(UIContentSizeCategoryDidChangeNotification); //7_0
            
        case JMApplicationUserDidTakeScreenshotNotification:
            ReturnNSStringIfExistAtAddress(UIApplicationUserDidTakeScreenshotNotification); //7_0
            
        case JMDeviceOrientationDidChangeNotification:                      return UIDeviceOrientationDidChangeNotification;
        case JMDeviceBatteryStateDidChangeNotification:                     return UIDeviceBatteryStateDidChangeNotification; //3_0
        case JMDeviceBatteryLevelDidChangeNotification:                     return UIDeviceBatteryLevelDidChangeNotification; //3_0
        case JMDeviceProximityStateDidChangeNotification:                   return UIDeviceProximityStateDidChangeNotification; //3_0
            
        //<UIKit/UIDocument.h>
        case JMDocumentStateChangedNotification:
            ReturnNSStringIfExistAtAddress(UIDocumentStateChangedNotification); //5_0
            
        //<UIKit/UIMenuController.h>
        case JMMenuControllerWillShowMenuNotification:          return UIMenuControllerWillShowMenuNotification;
        case JMMenuControllerDidShowMenuNotification:           return UIMenuControllerDidShowMenuNotification;
        case JMMenuControllerWillHideMenuNotification:          return UIMenuControllerWillHideMenuNotification;
        case JMMenuControllerDidHideMenuNotification:           return UIMenuControllerDidHideMenuNotification;
        case JMMenuControllerMenuFrameDidChangeNotification:    return UIMenuControllerMenuFrameDidChangeNotification;
            
        //<UIKit/UIPasteboard.h>
        case JMPasteboardChangedNotification:                   return UIPasteboardChangedNotification;
        case JMPasteboardRemovedNotification:                   return UIPasteboardRemovedNotification;
            
        //<UIKit/UIScreen.h>
        case JMScreenDidConnectNotification:                    return UIScreenDidConnectNotification; //3_2
        case JMScreenDidDisconnectNotification:                 return UIScreenDidDisconnectNotification; //3_2
        case JMScreenModeDidChangeNotification:                 return UIScreenModeDidChangeNotification; //3_2
        case JMScreenBrightnessDidChangeNotification:           return UIScreenBrightnessDidChangeNotification; //5_0
            
        //<UIKit/UITableView.h>
        case JMTableViewSelectionDidChangeNotification:         return UITableViewSelectionDidChangeNotification;
            
        //<UIKit/UITextInput.h>
        case JMTextInputCurrentInputModeDidChangeNotification:  return UITextInputCurrentInputModeDidChangeNotification; //4_2
            
        //<UIKit/UITextView.h>
        case JMTextViewTextDidBeginEditingNotification:         return UITextViewTextDidBeginEditingNotification;
        case JMTextViewTextDidChangeNotification:               return UITextViewTextDidChangeNotification;
        case JMTextViewTextDidEndEditingNotification:           return UITextViewTextDidEndEditingNotification;
            
        //<UIKit/UIViewController.h>
        case JMViewControllerShowDetailTargetDidChangeNotification:     return UIViewControllerShowDetailTargetDidChangeNotification;
            
            
        //<UIKit/NSManagedObjectContext.h>
        case JMManagedObjectContextWillSaveNotification:            return NSManagedObjectContextWillSaveNotification;
        case JMManagedObjectContextDidSaveNotification:             return NSManagedObjectContextDidSaveNotification;
        case JMManagedObjectContextObjectsDidChangeNotification:    return NSManagedObjectContextObjectsDidChangeNotification;
            
        //<CoreData/NSPersistentStoreCoordinator.h>
        case JMPersistentStoreDidImportUbiquitousContentChangesNotification:
            ReturnNSStringIfExistAtAddress(NSPersistentStoreDidImportUbiquitousContentChangesNotification);
            
        case JMPersistentStoreCoordinatorStoresWillChangeNotification:
            ReturnNSStringIfExistAtAddress(NSPersistentStoreCoordinatorStoresWillChangeNotification);
            
        case JMPersistentStoreCoordinatorStoresDidChangeNotification:
            return NSPersistentStoreCoordinatorStoresDidChangeNotification;
            
        //<Foundation/NSBundle.h>
        case JMBundleDidLoadNotification:           return NSBundleDidLoadNotification;
            
        //<Foundation/NSCalendar.h>
        case JMCalendarDayChangedNotification:
            ReturnNSStringIfExistAtAddress(NSCalendarDayChangedNotification);
            
        //<Foundation/NSDate.h>
        case JMSystemClockDidChangeNotification:   return NSSystemClockDidChangeNotification;
            
            //<Foundation/NSExtensionContext.h>
        case JMExtensionHostWillEnterForegroundNotification:
            ReturnNSStringIfExistAtAddress(NSExtensionHostWillEnterForegroundNotification);
            
        case JMExtensionHostDidEnterBackgroundNotification:
            ReturnNSStringIfExistAtAddress(NSExtensionHostDidEnterBackgroundNotification);
            
        case JMExtensionHostWillResignActiveNotification:
            ReturnNSStringIfExistAtAddress(NSExtensionHostWillResignActiveNotification);
            
        case JMExtensionHostDidBecomeActiveNotification:
            ReturnNSStringIfExistAtAddress(NSExtensionHostDidBecomeActiveNotification);
            
        //<Foundation/NSFileHandle.H>
        case JMFileHandleReadCompletionNotification:            return NSFileHandleReadCompletionNotification;
        case JMFileHandleReadToEndOfFileCompletionNotification: return NSFileHandleReadToEndOfFileCompletionNotification;
        case JMFileHandleConnectionAcceptedNotification:        return NSFileHandleConnectionAcceptedNotification;
        case JMFileHandleDataAvailableNotification:             return NSFileHandleDataAvailableNotification;
        case JMFileHandleNotificationDataItem:                  return NSFileHandleNotificationDataItem;
        case JMFileHandleNotificationFileHandleItem:            return NSFileHandleNotificationFileHandleItem;
        case JMFileHandleNotificationMonitorModes:
            ReturnNSStringIfExistAtAddress(NSFileHandleNotificationMonitorModes);
            
        //<Foundation/NSFileManager.h>
        case JMUbiquityIdentityDidChangeNotification:
            ReturnNSStringIfExistAtAddress(NSUbiquityIdentityDidChangeNotification);
            
        //<Foundation/NSHTTPCookieStorage.H>
        case JMHTTPCookieManagerAcceptPolicyChangedNotification:return NSHTTPCookieManagerAcceptPolicyChangedNotification;
        case JMHTTPCookieManagerCookiesChangedNotification:     return NSHTTPCookieManagerCookiesChangedNotification;
            
        //<Foundation/NSLocale.h>
        case JMCurrentLocaleDidChangeNotification:              return NSCurrentLocaleDidChangeNotification;
            
        //<Foundation/NSMetadata.h>
        case JMMetadataQueryDidStartGatheringNotification:
            ReturnNSStringIfExistAtAddress(NSMetadataQueryDidStartGatheringNotification);
            
        case JMMetadataQueryGatheringProgressNotification:
            ReturnNSStringIfExistAtAddress(NSMetadataQueryGatheringProgressNotification);
            
        case JMMetadataQueryDidFinishGatheringNotification:
            ReturnNSStringIfExistAtAddress(NSMetadataQueryDidFinishGatheringNotification);
            
        case JMMetadataQueryDidUpdateNotification:
            ReturnNSStringIfExistAtAddress(NSMetadataQueryDidUpdateNotification);
            
        //<Foundation/NSPort.h>
        case JMPortDidBecomeInvalidNotification:                return NSPortDidBecomeInvalidNotification;
            
            //<Foundation/NSThread.h>
        case JMWillBecomeMultiThreadedNotification:             return NSWillBecomeMultiThreadedNotification;
        case JMDidBecomeSingleThreadedNotification:             return NSDidBecomeSingleThreadedNotification;
        case JMThreadWillExitNotification:                      return NSThreadWillExitNotification;
            
        //<Foundation/NSTimeZone.h>
        case JMSystemTimeZoneDidChangeNotification:             return NSSystemTimeZoneDidChangeNotification;
            
        //<Foundation/NSUbiquitousKeyValueStore.h>
        case JMUbiquitousKeyValueStoreDidChangeExternallyNotification:
            return NSUbiquitousKeyValueStoreDidChangeExternallyNotification;
            
        //<Foundation/NSUndoManager.h>
        case JMUndoManagerCheckpointNotification:               return NSUndoManagerCheckpointNotification;
        case JMUndoManagerWillUndoChangeNotification:           return NSUndoManagerWillUndoChangeNotification;
        case JMUndoManagerWillRedoChangeNotification:           return NSUndoManagerWillRedoChangeNotification;
        case JMUndoManagerDidUndoChangeNotification:            return NSUndoManagerDidUndoChangeNotification;
        case JMUndoManagerDidRedoChangeNotification:            return NSUndoManagerDidRedoChangeNotification;
        case JMUndoManagerDidOpenUndoGroupNotification:         return NSUndoManagerDidOpenUndoGroupNotification;
        case JMUndoManagerWillCloseUndoGroupNotification:       return NSUndoManagerWillCloseUndoGroupNotification;
        case JMUndoManagerDidCloseUndoGroupNotification:
            ReturnNSStringIfExistAtAddress(NSUndoManagerDidCloseUndoGroupNotification);
            
        //<Foundation/NSURLCredentialStorage.h>
        case JMURLCredentialStorageChangedNotification:         return NSURLCredentialStorageChangedNotification;
            
        //<Foundation/NSUserDefaults.h>
        case JMUserDefaultsDidChangeNotification:               return NSUserDefaultsDidChangeNotification;
            
        //<AssetsLibrary/ALAssetsLibrary.h>
        case JMAssetsLibraryChangedNotification:                return ALAssetsLibraryChangedNotification;
            
        //<Accounts/ACAccountStore.h>
        case JMAccountStoreDidChangeNotification:
            ReturnNSStringIfExistAtAddress(ACAccountStoreDidChangeNotification);
           
        //<PassKit/PKPassLibrary.h>
        case JMPassLibraryDidChangeNotification:
            ReturnNSStringIfExistAtAddress(PKPassLibraryDidChangeNotification);
        
        //<EventKit/EKEventStore.h>
        case JMEventStoreChangedNotification : return EKEventStoreChangedNotification;
          
        //<MessageUI/MFMessageComposeViewController.h>
        case JMMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification :
            ReturnNSStringIfExistAtAddress( MFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification);

    }
    
    return nil;
}

@implementation NSObject (JMSystemNotification)

#pragma mark - Getter / Setter

- (NSMutableDictionary *)jm_observedNotificationDictionary
{
    return objc_getAssociatedObject(self, &kObservedNotificationNamesKey);
}

- (void)jm_setObservedNotificationDictionary:(NSDictionary *)dict
{
    objc_setAssociatedObject(self, &kObservedNotificationNamesKey,dict, OBJC_ASSOCIATION_RETAIN);
}

#pragma mark -

- (NSArray *)jm_observedNotificationNames
{
    return [[self jm_observedNotificationDictionary] allKeys];
}

- (void)jm_addObservedNotificationName:(NSString *)notificationName notificationId:(id)notificationId
{
    NSMutableDictionary *dict = [self jm_observedNotificationDictionary];
    if (nil == dict) {
        dict = [NSMutableDictionary new];
    }
    [dict setObject:notificationId forKey:notificationName];

    objc_setAssociatedObject(self, &kObservedNotificationNamesKey,dict, OBJC_ASSOCIATION_RETAIN);
}

#pragma mark - add

- (BOOL)jm_observeNotificationName:(NSString *)notificationName usingBlock:(JMNotificationBlock)block
{
    if ([self isAlreadyObservingNotificationName:notificationName]) {
        return NO;
    }
    
    id notificationId = [[NSNotificationCenter defaultCenter] addObserverForName:notificationName
                                                                          object:nil
                                                                           queue:nil
                                                                      usingBlock:^(NSNotification *note) {
                                                                          block(note);
                                                                      }];
    [self jm_addObservedNotificationName:notificationName notificationId:notificationId];
    return YES;
}

- (BOOL)jm_observeNotification:(JMSystemNotification)notification usingBlock:(JMNotificationBlock)block
{
    return [self jm_observeNotification:notification usingBlock:block error:NULL];
}

- (BOOL)jm_observeNotification:(JMSystemNotification)notification usingBlock:(JMNotificationBlock)block error:(NSError **)error
{
    NSString *notificationName = JMSystemNotificationName(notification);
    if (nil == notificationName) {
        if (error != NULL) {
            *error = [NSError jm_errorWithNotificationError:JMNotificationNotAvailableError];
        }
        return NO;
    }
    
    if ([self isAlreadyObservingNotificationName:notificationName]) {
        *error = [NSError jm_errorWithNotificationError:JMNotificationAlreadyObservedError];
        return NO;
    }
    
    id notificationId = [[NSNotificationCenter defaultCenter] addObserverForName:notificationName
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note) {
                                                      block(note);
                                                  }];
    [self jm_addObservedNotificationName:notificationName notificationId:notificationId];
    return YES;
}

#pragma mark - remove

- (void)jm_removeObservedNotification:(JMSystemNotification)notification
{
    NSString *notificationName = JMSystemNotificationName(notification);
    [self jm_removeObservedNotificationName:notificationName];
}

- (void)jm_removeObservedNotificationName:(NSString *)notificationName
{
    NSMutableDictionary *dict = [self jm_observedNotificationDictionary];
    [dict removeObjectForKey:notificationName];
    [self jm_setObservedNotificationDictionary:dict];
}

- (void)jm_removeObservedNotifications
{
    NSDictionary *observedDict = [self jm_observedNotificationDictionary];
    
    if (observedDict.allKeys) {
        [observedDict.allKeys enumerateObjectsUsingBlock:^(NSString *notificationName, NSUInteger idx, BOOL *stop) {
            [[NSNotificationCenter defaultCenter] removeObserver:[observedDict objectForKey:notificationName]];
            //NSLog(@"jm_removeObservedNotification : %@",notificationName);
        }];
        
        [self jm_setObservedNotificationDictionary:[NSMutableDictionary new]];
    }
}

#pragma mark - Private

- (BOOL)isAlreadyObservingNotificationName:(NSString *)notificationName
{
    return [[self jm_observedNotificationNames] containsObject:notificationName];
}

@end

