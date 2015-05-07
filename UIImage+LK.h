
#import <UIKit/UIKit.h>
@interface UIImage (LK)

/**
 * 把一张图片裁成圆形图片
 *
 * 参数
 * 要裁剪的图片
 */
+ (instancetype)cutCricleImage:(NSString *)imageName;

/**
 * 把一张图片裁成带光环的圆形图片
 *
 * 参数
 * 1. 要裁剪的图片
 * 2. 边框宽度
 * 3. 边框颜色
 */
+ (instancetype)cutCricleImage:(NSString *)imageName borderWidth:(CGFloat)borderWidth color:(UIColor *)color;

/**
 * 给图片加水印
 *
 * 参数
 * 1. 要加水印的图片
 * 2. 水印图片
 */
+ (instancetype)waterImage:(NSString *)imageName logo:(NSString *)logoName;

/**
 * 给图片加水印
 *
 * 参数
 * 1. 要加水印的图片
 * 2. 水印图片
 * 3. 水印图片的位置
 */
+ (instancetype)waterImage:(NSString *)imageName logo:(NSString *)logoName logoFrame:(CGRect)logoFrame;

/**
 * 随意拉伸图片而不变形
 */
+ (UIImage *)resizableImage:(NSString *)imgName;
@end
