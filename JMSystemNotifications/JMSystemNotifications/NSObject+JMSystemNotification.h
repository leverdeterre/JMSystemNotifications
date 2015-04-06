//
//  NSObject+JMSystemNotification.h
//  JMSystemNotifications
//
//  Created by jerome morissard on 04/04/2015.
//  Copyright (c) 2015 Jérôme Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ReturnNSStringIfExistAtAddress(constString){ \
    if (&constString != NULL) { \
        return constString; \
    }\
    return nil; \
} \

typedef NS_ENUM(NSInteger, JMSystemNotification) {
    
    //<UIKit/NSTextStorage.h>
    JMTextStorageWillProcessEditingNotification = 1,
    JMTextStorageDidProcessEditingNotification,
    
    //<UIKit/UIWindow.h>
    JMWindowDidBecomeVisibleNotification,
    JMWindowDidBecomeHiddenNotification,
    JMWindowDidBecomeKeyNotification,
    JMWindowDidResignKeyNotification,
    
    JMKeyboardWillShowNotification,
    JMKeyboardDidShowNotification,
    JMKeyboardWillHideNotification,
    JMKeyboardDidHideNotification,
    JMKeyboardWillChangeFrameNotification,
    JMKeyboardDidChangeFrameNotification,
    
    //<UIKit/UITextField.h>
    JMTextFieldTextDidBeginEditingNotification,
    JMTextFieldTextDidEndEditingNotification,
    JMTextFieldTextDidChangeNotification,
    
    //<UIKit/UIAccessibilityConstants.h>
    //JMAccessibilityPostNotification,
    JMAccessibilityMonoAudioStatusDidChangeNotification,            //5_0
    JMAccessibilityClosedCaptioningStatusDidChangeNotification,     //5_0
    JMAccessibilityInvertColorsStatusDidChangeNotification,         //6_0
    JMAccessibilityGuidedAccessStatusDidChangeNotification,         //6_0
    JMAccessibilityBoldTextStatusDidChangeNotification,             //8_0
    JMAccessibilityGrayscaleStatusDidChangeNotification,            //8_0
    JMAccessibilityReduceTransparencyStatusDidChangeNotification ,  //8_0
    JMAccessibilityReduceMotionStatusDidChangeNotification,         //8_0
    JMAccessibilityDarkerSystemColorsStatusDidChangeNotification ,  //8_0
    JMAccessibilitySwitchControlStatusDidChangeNotification ,       //8_0
    JMAccessibilitySpeakSelectionStatusDidChangeNotification ,      //8_0
    JMAccessibilitySpeakScreenStatusDidChangeNotification ,         //8_0
    //JMAccessibilityScreenChangedNotification ,
    //JMAccessibilityLayoutChangedNotification,
    //JMAccessibilityAnnouncementNotification,
    //JMAccessibilityAnnouncementDidFinishNotification,
    //JMAccessibilityPageScrolledNotification,
    //JMAccessibilityPauseAssistiveTechnologyNotification,          //8_0
    //JMAccessibilityResumeAssistiveTechnologyNotification,         //8_0
    JMAccessibilityNotificationSwitchControlIdentifier,             //8_0
    
    //<UIKit/UIApplication.h>
    JMApplicationDidEnterBackgroundNotification,                    //4_0
    JMApplicationWillEnterForegroundNotification,                   //4_0
    JMApplicationDidFinishLaunchingNotification,
    JMApplicationDidBecomeActiveNotification,
    JMApplicationWillResignActiveNotification,
    JMApplicationDidReceiveMemoryWarningNotification,
    JMApplicationWillTerminateNotification,
    JMApplicationSignificantTimeChangeNotification,
    JMApplicationWillChangeStatusBarOrientationNotification,
    JMApplicationDidChangeStatusBarOrientationNotification,
    JMApplicationWillChangeStatusBarFrameNotification,
    JMApplicationDidChangeStatusBarFrameNotification,
    JMApplicationBackgroundRefreshStatusDidChangeNotification,
    
    JMContentSizeCategoryDidChangeNotification,                     //7_0
    
    JMApplicationUserDidTakeScreenshotNotification,                 //7_0
    
    JMDeviceOrientationDidChangeNotification,
    JMDeviceBatteryStateDidChangeNotification,                      //3_0
    JMDeviceBatteryLevelDidChangeNotification,                      //3_0
    JMDeviceProximityStateDidChangeNotification,                    //3_0
    
    //<UIKit/UIDocument.h>
    JMDocumentStateChangedNotification,                             //5_0
    
    //<UIKit/UIMenuController.h>
    JMMenuControllerWillShowMenuNotification,
    JMMenuControllerDidShowMenuNotification,
    JMMenuControllerWillHideMenuNotification,
    JMMenuControllerDidHideMenuNotification,
    JMMenuControllerMenuFrameDidChangeNotification,
    
    //<UIKit/UIPasteboard.h>
    JMPasteboardChangedNotification,
    JMPasteboardRemovedNotification,
    
    //<UIKit/UIScreen.h>
    JMScreenDidConnectNotification,                                 //3_2
    JMScreenDidDisconnectNotification,                              //3_2
    JMScreenModeDidChangeNotification,                              //3_2
    JMScreenBrightnessDidChangeNotification,                        //5_0
    
    //<UIKit/UITableView.h>
    JMTableViewSelectionDidChangeNotification,
    
    //<UIKit/UITextInput.h>
    JMTextInputCurrentInputModeDidChangeNotification,               //4_2
    
    //<UIKit/UITextView.h>
    JMTextViewTextDidBeginEditingNotification,
    JMTextViewTextDidChangeNotification,
    JMTextViewTextDidEndEditingNotification,
    
    //<UIKit/UIViewController.h>
    JMViewControllerShowDetailTargetDidChangeNotification,           //8_0
    
    //<CoreData/NSManagedObjectContext.h>
    JMManagedObjectContextWillSaveNotification,
    JMManagedObjectContextDidSaveNotification,
    JMManagedObjectContextObjectsDidChangeNotification,
    
    JMPersistentStoreDidImportUbiquitousContentChangesNotification,
    JMPersistentStoreCoordinatorStoresWillChangeNotification,
    JMPersistentStoreCoordinatorStoresDidChangeNotification,
    
    //<Foundation/NSBundle.h>
    JMBundleDidLoadNotification,
    
    //<Foundation/NSCalendar.h>
    JMCalendarDayChangedNotification,
    
    //<Foundation/NSDate.h>
    JMSystemClockDidChangeNotification,
    
    //<Foundation/NSExtensionContext.h>
    JMExtensionHostWillEnterForegroundNotification,         //8_2
    JMExtensionHostDidEnterBackgroundNotification,          //8_2
    JMExtensionHostWillResignActiveNotification,            //8_2
    JMExtensionHostDidBecomeActiveNotification,             //8_2
    
    //<Foundation/NSFileHandle.h>
    JMFileHandleReadCompletionNotification,
    JMFileHandleReadToEndOfFileCompletionNotification,
    JMFileHandleConnectionAcceptedNotification,
    JMFileHandleDataAvailableNotification,
    JMFileHandleNotificationDataItem,
    JMFileHandleNotificationFileHandleItem,
    JMFileHandleNotificationMonitorModes,
    
    JMUbiquityIdentityDidChangeNotification,
    
    JMHTTPCookieManagerAcceptPolicyChangedNotification,
    JMHTTPCookieManagerCookiesChangedNotification,
    
    //<Foundation/NSLocale.h>
    JMCurrentLocaleDidChangeNotification,
    
    //<Foundation/NSMetadata.h>
    JMMetadataQueryDidStartGatheringNotification,
    JMMetadataQueryGatheringProgressNotification,
    JMMetadataQueryDidFinishGatheringNotification,
    JMMetadataQueryDidUpdateNotification,
    
    //<Foundation/NSPort.h>
    JMPortDidBecomeInvalidNotification,
    
    //<Foundation/NSThread.h>
    JMWillBecomeMultiThreadedNotification,
    JMDidBecomeSingleThreadedNotification,
    JMThreadWillExitNotification,
    
    //<Foundation/NSThread.h>
    JMSystemTimeZoneDidChangeNotification,
    
    //<Foundation/NSUbiquitousKeyValueStore.h>
    JMUbiquitousKeyValueStoreDidChangeExternallyNotification,
    
    //<Foundation/NSUndoManager.h>
    JMUndoManagerCheckpointNotification,
    JMUndoManagerWillUndoChangeNotification,
    JMUndoManagerWillRedoChangeNotification,
    JMUndoManagerDidUndoChangeNotification,
    JMUndoManagerDidRedoChangeNotification,
    JMUndoManagerDidOpenUndoGroupNotification,
    JMUndoManagerWillCloseUndoGroupNotification,
    JMUndoManagerDidCloseUndoGroupNotification,
    
    //<Foundation/NSURLCredentialStorage.h>
    JMURLCredentialStorageChangedNotification,
    
    //<Foundation/NSUserDefaults.h>
    JMUserDefaultsDidChangeNotification,
    
    //<AssetsLibrary/ALAssetsLibrary.h>
    JMAssetsLibraryChangedNotification,
    
    //<Accounts/ACAccountStore.h>
    JMAccountStoreDidChangeNotification,
    
    //<PassKit/PKPassLibrary.h>
    JMPassLibraryDidChangeNotification,
    
    //<EventKit/EKEventStore.h>
    JMEventStoreChangedNotification,
    
    //<MessageUI/MFMessageComposeViewController.h>
    JMMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification

    //TODO
    //AVFoundation
    //CloudKit
    //CoreBluetooth ?
    //CoreFoundation ?
    //CoreMedia ?
    //ExternalAccessory
    //GameKit
    //GameController
    //HealthKit
    //MediaPlayer
    //NetworkExtension
    //NewsstandKit
};

NSString * JMSystemNotificationName(JMSystemNotification num);

typedef void(^JMNotificationBlock)(NSNotification *notif);

@interface NSObject (JMSystemNotification)

- (BOOL)jm_observeNotification:(JMSystemNotification)notification usingBlock:(JMNotificationBlock)block;
- (BOOL)jm_observeNotification:(JMSystemNotification)notification usingBlock:(JMNotificationBlock)block error:(NSError **)error;

- (void)jm_removeObservedNotification:(JMSystemNotification)notification;
- (void)jm_removeObservedNotifications;

@end
