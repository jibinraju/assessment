//
//  BaseParser.h
//  RabobankTest
//
//  Created by Jibin Raju on 08/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

typedef NS_ENUM(NSInteger, ParserType) {
    CSV_FILE_TYPE
};

typedef void(^ParsingFinished)(NSArray *_Nonnull);

@protocol BaseParser<NSObject>

- (nullable instancetype)initWithFilePath:(nonnull NSString *)filePath andCallBackBlock:(_Nonnull ParsingFinished)parsingFinishedBlk;
- (ParserType) getParserType;
- (void)parse;

@end
