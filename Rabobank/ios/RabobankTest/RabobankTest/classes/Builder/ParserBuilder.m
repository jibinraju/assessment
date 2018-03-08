//
//  ParserBuilder.m
//  RabobankTest
//
//  Created by Jibin Raju on 08/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

#import "ParserBuilder.h"
#import "CsvParser.h"

@implementation ParserBuilder

+ (id<BaseParser>)parserForType:(ParserType)parserType filePath:(NSString *)fullPath  andCallBackBlock:(ParsingFinished)parsingFinishedBlk {
    if (parserType == CSV_FILE_TYPE) {
        return [[CsvParser alloc] initWithFilePath:fullPath andCallBackBlock:parsingFinishedBlk];
    }
    
    return nil;
}

@end
