//
//  AFChoiceButton.h
//  AFCommon
//
//  Created by 阿凡树( http://blog.afantree.com ) on 13-4-18.
//  Copyright (c) 2013年 ManGang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AFChoiceButton;
@protocol AFChoiceButtonDelegate;
typedef NS_ENUM(NSInteger, AFChoiceButtonStatusType) {
    AFChoiceButtonStatusTypeCancel = 0,
    AFChoiceButtonStatusTypeSelect = 1,
};
typedef NS_ENUM(NSInteger, AFChoiceType) {
    AFChoiceTypeRadio = 0,
    AFChoiceTypeCheck = 1,
};
@interface AFChoiceButton : UIButton
{
    NSString                     *_groupId;
    NSUInteger                    _index;
    AFChoiceButtonStatusType      _statustype;
    AFChoiceType                  _choiceType;
}
@property (nonatomic, readonly) NSString* groupId;
@property (nonatomic, readonly) AFChoiceType choiceType;

@property (nonatomic, readwrite, assign) id<AFChoiceButtonDelegate> delegate;
@property (nonatomic, readwrite, assign) AFChoiceButtonStatusType statustype;
//仅仅是对AFChoiceTypeRadio状态下面有效
@property (nonatomic, readwrite, assign) BOOL mustChooseOne;
@property (nonatomic, readwrite, assign) NSUInteger index;


+ (id)buttonWithFrame:(CGRect)frame andChoiceType:(AFChoiceType)choiceType withIndex:(NSUInteger)index inGroup:(NSString*)groupId withSelectedImage:(UIImage*)selectedImage andNormalImage:(UIImage*)normalImage;

@end
@protocol AFChoiceButtonDelegate <NSObject>

-(void)choiceButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString*)groupId;

-(void)choiceButtonCancelAtIndex:(NSUInteger)index inGroup:(NSString*)groupId;

@end