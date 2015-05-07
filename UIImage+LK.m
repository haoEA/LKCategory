
#import "UIImage+LK.h"

@implementation UIImage (LK)
+ (instancetype)cutCricleImage:(NSString *)imageName
{
    UIImage *img = [UIImage imageNamed:imageName];
    
    // 开启一个新的位图上下文对象
    UIGraphicsBeginImageContextWithOptions(img.size, NO, 0.0);
    
    // 获取当前的上下文对象
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 画圆
    CGFloat centerX = img.size.width * 0.5;
    CGFloat centerY = img.size.height * 0.5;
    CGFloat radius = MIN(img.size.width, img.size.height) * 0.5;
    CGContextAddArc(ctx, centerX, centerY, radius, 0, M_PI * 2, 0);
    
    // 裁剪
    CGContextClip(ctx);

    // 绘制图片到上下文
    [img drawInRect:CGRectMake(0, 0, img.size.width, img.size.height)];

    // 获取上下文中已经绘制好的图形
    UIImage *newImg =  UIGraphicsGetImageFromCurrentImageContext();
    //结束一个上下文对象
    UIGraphicsEndImageContext();

    return newImg;
}

+ (instancetype)cutCricleImage:(NSString *)imageName borderWidth:(CGFloat)borderWidth color:(UIColor *)color
{
    UIImage *oldImg = [UIImage imageNamed:imageName];
    
    // 先开启一个比图片大一个边框的上下文
    CGFloat imgW = oldImg.size.width + 2 * borderWidth;
    CGFloat imgH = oldImg.size.height + 2 * borderWidth;
    CGSize imgSize = CGSizeMake(imgW, imgH);
    
    UIGraphicsBeginImageContextWithOptions(imgSize, NO, 0.0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 先画比图片大一个边框的大圆, 填充当做参数传来的边框颜色
    // 大圆的圆心、半径
    CGFloat bigRaduis = imgW * 0.5;
    CGFloat centerX = bigRaduis;
    CGFloat centerY = bigRaduis;
    [color set];
    CGContextAddArc(ctx, centerX, centerY, bigRaduis, 0, M_PI *2, 1);
    CGContextFillPath(ctx);
    
    // 画小圆，并把图片渲染在上面
    CGFloat smallRadius = bigRaduis - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 1);
    CGContextClip(ctx);
    [oldImg drawInRect:CGRectMake(borderWidth, borderWidth, oldImg.size.width, oldImg.size.height)];
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImg;
}
/**
 * 给图片加水印
 */
+ (instancetype)waterImage:(NSString *)imageName logo:(NSString *)logoName
{
    UIImage *oldImage = [UIImage imageNamed:imageName];
    
    // 开启一个位图上下文
    CGSize oldSize = CGSizeMake(oldImage.size.width, oldImage.size.height);
    UIGraphicsBeginImageContextWithOptions(oldSize, NO, 0.0);
    
    // 把图片画到上下文中
    [oldImage drawInRect:CGRectMake(0, 0, oldSize.width, oldSize.height)];
    
    // 把文字画到图片上
    UIImage *logoImg = [UIImage imageNamed:logoName];
    CGFloat logoW = logoImg.size.width * 0.2;
    CGFloat logoH = logoImg.size.height * 0.2;
    CGFloat margin = 5;
    CGFloat logoX = oldSize.width - logoW - margin;
    CGFloat logoY = oldSize.height - logoH - margin;
    [logoImg drawInRect:CGRectMake(logoX, logoY, logoW, logoH)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
/**
 * 给图片加水印
 * logo的位置自定义
 */
+ (instancetype)waterImage:(NSString *)imageName logo:(NSString *)logoName logoFrame:(CGRect)logoFrame
{
    UIImage *oldImage = [UIImage imageNamed:imageName];
    
    // 开启一个位图上下文
    CGSize oldSize = CGSizeMake(oldImage.size.width, oldImage.size.height);
    UIGraphicsBeginImageContextWithOptions(oldSize, NO, 0.0);
    
    // 把图片画到上下文中
    [oldImage drawInRect:CGRectMake(0, 0, oldSize.width, oldSize.height)];
    
    // 把文字画到图片上
    UIImage *logoImg = [UIImage imageNamed:logoName];
    [logoImg drawInRect:logoFrame];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/**
  * 随意拉伸图片而不变形
  */
+ (UIImage *)resizableImage:(NSString *)imgName
{
    UIImage *normal = [UIImage imageNamed:imgName];
    CGFloat w = normal.size.width * 0.5;
    CGFloat h = normal.size.height * 0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}
@end
