//
//  SCParseManager+SCUser.h
//  syncano4-ios
//
//  Created by Jan Lipmann on 07/05/15.
//  Copyright (c) 2015 Syncano. All rights reserved.
//

#import "SCParseManager.h"
@class SCUser;

NS_ASSUME_NONNULL_BEGIN

@interface SCParseManager (SCUser)


@property (nullable,nonatomic,readonly) Class userClass;
@property (nullable,nonatomic,readonly) Class userProfileClass;


/**
 *  Registers class for user subclassing
 *
 *  @param classToRegister
 */
- (void)registerUserClass:(__unsafe_unretained Class)classToRegister;

/**
 *  Registers class for subclassing user profile
 *
 *  @param classToRegister
 */
- (void)registerUserProfileClass:(__unsafe_unretained Class)classToRegister;

/**
 *  Attempts to parse JSON to SCUserObject
 *
 *  @param JSONObject serialized JSON object from API response
 *
 *  @return SCUser or subclass object
 */
- (nullable id)parsedUserObjectFromJSONObject:(id)JSONObject;
@end
NS_ASSUME_NONNULL_END