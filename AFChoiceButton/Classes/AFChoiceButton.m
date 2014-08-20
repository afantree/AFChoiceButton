//
//  AFChoiceButton.m
//  AFCommon
//
//  Created by 阿凡树( http://blog.afantree.com ) on 13-4-18.
//  Copyright (c) 2013年 ManGang. All rights reserved.
//

#import "AFChoiceButton.h"

@implementation AFChoiceButton

+ (id)buttonWithFrame:(CGRect)frame andChoiceType:(AFChoiceType)choiceType withIndex:(NSUInteger)index inGroup:(NSString*)groupId withSelectedImage:(UIImage*)selectedImage andNormalImage:(UIImage*)normalImage;
{
    AFChoiceButton* b=[[AFChoiceButton alloc] initWithChoiceType:choiceType inGroup:groupId];
    b.choiceType=choiceType;
    b.frame=frame;
    b.index=index;
    [b setBackgroundImage:selectedImage forState:UIControlStateSelected];
    [b setBackgroundImage:normalImage forState:UIControlStateNormal];
    [b addTarget:b action:@selector(checkBoxPress) forControlEvents:UIControlEventTouchUpInside];
    return b;
}
-(id)initWithChoiceType:(AFChoiceType)choiceType inGroup:(NSString*)groupId
{
    self = [super init];
    if (self) {
        self.choiceType=choiceType;
        self.groupId=groupId;
        if (choiceType == AFChoiceTypeRadio) {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cancelOthers:) name:groupId object:nil];
        }
    }
    return self;
}

-(void)cancelOthers:(NSNotification*)notification
{
    int selectedIndex=[[notification.userInfo objectForKey:@"index"] unsignedIntValue];
    if (selectedIndex != self.index) {
        self.statustype=AFChoiceButtonStatusTypeCancel;
    }
}
-(void)dealloc
{
    if (_choiceType == AFChoiceTypeRadio) {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
}
-(void)checkBoxPress
{
    switch (_statustype) {
        case AFChoiceButtonStatusTypeSelect:
            if ((_choiceType == AFChoiceTypeRadio) && _mustChooseOne) {
                return;
            }
            _statustype=AFChoiceButtonStatusTypeCancel;
            self.selected=NO;
            if ([_delegate respondsToSelector:@selector(choiceButtonCancelAtIndex:inGroup:)]) {
                [_delegate choiceButtonCancelAtIndex:_index inGroup:_groupId];
            }
            break;
        case AFChoiceButtonStatusTypeCancel:
            _statustype=AFChoiceButtonStatusTypeSelect;
            self.selected=YES;
            if ([_delegate respondsToSelector:@selector(choiceButtonSelectedAtIndex:inGroup:)]) {
                [_delegate choiceButtonSelectedAtIndex:_index inGroup:_groupId];
            }
            if (_choiceType == AFChoiceTypeRadio) {
                NSDictionary* dict=[NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"%lu",(unsigned long)_index] forKey:@"index"];
                [[NSNotificationCenter defaultCenter] postNotificationName:_groupId object:self userInfo:dict];
            }
            break;
        default:
            break;
    }
}
-(void)setStatustype:(AFChoiceButtonStatusType)statustype
{
    _statustype=statustype;
    switch (statustype) {
        case AFChoiceButtonStatusTypeSelect:
            self.selected=YES;
            if (_choiceType == AFChoiceTypeRadio) {
                NSDictionary* dict=[NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"%lu",(unsigned long)_index] forKey:@"index"];
                [[NSNotificationCenter defaultCenter] postNotificationName:_groupId object:self userInfo:dict];
            }
            break;
        case AFChoiceButtonStatusTypeCancel:
            self.selected=NO;
            break;
    }
}

@end
