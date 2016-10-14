//
//  SCDataObject+Increment.h
//  syncano-ios
//
//  Created by Jakub Machoń on 04.02.2016.
//  Copyright © 2016 Syncano. All rights reserved.
//

#import "SCDataObject.h"
NS_ASSUME_NONNULL_BEGIN
@interface SCDataObject (Increment)
/**
 *  Increment key's value by provided number
 *
 *  @param keys                  NSDictionary with key name as a key and increment by value as a value
 *  @param apiClient             SCAPIClient to save data with
 *  @param completion            Completion block
 *  @param revisionMismatchBlock Revision mismatch verification block
 */
- (void)incrementKeys:(NSDictionary<NSString*,NSNumber*>*)keys usingAPIClient:(SCAPIClient *)apiClient withCompletion:(nullable SCCompletionBlock)completion revisionMismatchValidationBlock:(nullable SCDataObjectRevisionMismatchCompletionBlock)revisionMismatchBlock;

@end
NS_ASSUME_NONNULL_END