//
//  ParserBuilder.h
//  RabobankTest
//
//  Created by Jibin Raju on 08/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseParser.h"

@interface ParserBuilder : NSObject

+ (nullable id<BaseParser>)parserForType:(ParserType)parserType filePath:(nonnull NSString *)fullPath andCallBackBlock:(_Nonnull ParsingFinished)parsingFinishedBlk;

@end
