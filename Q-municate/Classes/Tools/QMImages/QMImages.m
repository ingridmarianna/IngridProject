//
//  QMImages.m

//
//  Created by Hideki on 5/19/16.
//  Copyright © 2016 Hideki_Ingrid. All rights reserved.
//

UIImage *QMStatusBarBackgroundImage() {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
