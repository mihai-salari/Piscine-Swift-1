//
//  SCScript.m
//  syncano-ios
//
//  Created by Mariusz Wisniewski on 3/8/16.
//  Copyright © 2016 Syncano. All rights reserved.
//

#import "SCScript.h"
#import "SCAPIClient.h"
#import "SCAPIClient_SCAPIClient.h"
#import "Syncano.h"

@implementation SCScript

+ (void)runScriptWithId:(NSNumber *)scriptId params:(NSDictionary *)params completion:(SCScriptCompletionBlock)completion {
    [self runScriptWithId:scriptId params:params usingAPIClient:[Syncano sharedAPIClient] completion:completion];
}

+ (void)runScriptWithId:(NSNumber *)scriptId params:(NSDictionary *)params onSyncano:(Syncano *)syncano completion:(SCScriptCompletionBlock)completion {
    [self runScriptWithId:scriptId params:params usingAPIClient:syncano.apiClient completion:completion];
}

+ (void)runScriptWithId:(NSNumber *)scriptId params:(NSDictionary *)params usingAPIClient:(SCAPIClient *)apiClient completion:(SCScriptCompletionBlock)completion {
    NSString *path = [NSString stringWithFormat:@"snippets/scripts/%@/run/",scriptId];
    NSDictionary *payload = (params) ? @{@"payload" : params} : nil;
    [apiClient POSTWithPath:path params:payload completion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (error) {
            if (completion) {
                completion(nil,error);
            }
        } else {
            if (completion) {
                SCTrace *trace = [[SCTrace alloc] initWithJSONObject:responseObject andScriptIdentifier:scriptId];
                completion(trace,error);
            }
        }
    }];
}

@end
