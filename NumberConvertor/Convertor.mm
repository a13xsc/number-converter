//
//  Convertor.m
//  NumberConvertor
//
//  Created by Alex Craciun on 23/10/15.
//  Copyright © 2015 Alex Craciun. All rights reserved.
//

#import "Convertor.h"
#import <iostream>
using namespace std;

@implementation Convertor

- (NSString *)arabToRoman:(NSInteger)x {
    string roman = "IVXLCDM";
    int digit = 0;
    string output,aux;
    while(x!=0) {
        aux = "";
        int m=x%10;
        if(m<=3) {
            for(int i=0;i<m;i++){
                aux+=roman[digit];
            }
        }
        else if(m==4) {
            aux=aux+roman[digit]+roman[digit+1];
        }
        else if(m>=5 && m<9) {
            aux+=roman[digit+1];
            if(m-5!=0) {
                for(int i=0;i<m-5;i++)
                    aux+=roman[digit];
            }
        }
        else {
            aux=aux+roman[digit]+roman[digit+2];
        }
        x/=10;
        output.insert(0,aux);
        digit+=2;
    }
    NSString *convertedNumber = [NSString stringWithUTF8String:output.c_str()];
    return convertedNumber;
}

int value(char x) {
    string roman = "IVXLCDM";
    int arab[] = {1,5,10,50,100,500,1000};
    int i;
    for(i=0;i<7;i++) {
        if(x==roman[i]) {
            break;
        }
    }
    return arab[i];
}

- (NSInteger)romanToArab:(NSString *)objcinput {
    objcinput = [objcinput uppercaseString];
    string input = [objcinput UTF8String];
    if(input[3]!='M') {
        NSInteger position=0,output=0;
        if(input.length()!=1) {//Nr. cifre >= 1
            while(position<input.length()-1) {
                if(value(input[position])<value(input[position+1])) {
                    if(input[position]=='I'||input[position]=='X'||input[position]=='C'||input[position]=='M') {
                        output -= value(input[position]);
                    }
                    else {
                        return -1;
                    }
                }
                else {
                    output += value(input[position]);
                }
                position++;
            }
            output += value(input[position]);
        }
        else {//Nr. cifre = 1
            output+=value(input[position]);
        }
        return output;
    }
    else {
        return -1;
    }
}

- (int)checkInput:(id)input {
    if ([input isKindOfClass:[NSString class]]) {
        NSCharacterSet *romans = [NSCharacterSet characterSetWithCharactersInString:@"IVXLCDM"];
        input = [input uppercaseString];
        for (NSUInteger i = 0; i < [input length]; i++) {
            if (![romans characterIsMember:[input characterAtIndex:i]]) {
                return 1;
            }
        }
    }
    else {
        NSInteger x = [(NSNumber*)input integerValue];
        if (!(x > 0 && x < 4000)) {
            return 1;
        }
    }
    return 0;
}


@end
