#include "GodotShare.h"
#include "GodotShareHelper.h"
#include "GodotShare-Swift.h"

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "platform/ios/app_delegate.h"

GodotShare *GodotShare::instance = NULL;

void GodotShare::_bind_methods(){
    ClassDB::bind_method(D_METHOD("share_img", "path"), &GodotShare::share_img);
    ClassDB::bind_method(D_METHOD("share_img_web", "url"), &GodotShare::share_img_web);
    ClassDB::bind_method(D_METHOD("function_demo", "i"), &GodotShare::function_demo);
    ClassDB::bind_method(D_METHOD("signal_demo", "s"), &GodotShare::signal_demo);
    ClassDB::bind_method(D_METHOD("share_video_web", "url"), &GodotShare::share_video_web);
    
    ADD_SIGNAL(MethodInfo("device_address_changed", PropertyInfo(Variant::STRING, "id")));
    ADD_SIGNAL(MethodInfo("signal_demo_complete", PropertyInfo(Variant::INT, "i"), PropertyInfo(Variant::STRING, "s")));
}

int GodotShare::function_demo(int i){
    return [SwiftClass function_demo:i];
}

void GodotShare::signal_demo(String s){
    NSString *ns = [NSString stringWithCString:s.utf8().get_data() encoding:NSUTF8StringEncoding];
    String ss = [ns UTF8String];
    emit_signal("signal_demo_complete", 1022, ss);
}

void GodotShare::share_img(String path){
    NSString *imagePath = [NSString stringWithCString:path.utf8().get_data() encoding:NSUTF8StringEncoding];
    [SwiftClass share_img:imagePath];
}

void GodotShare::share_img_web(String url){
    NSString *imageUrl = [NSString stringWithCString:url.utf8().get_data() encoding:NSUTF8StringEncoding];
    [SwiftClass share_img_web:imageUrl];
}

void GodotShare::share_video_web(String url){
    NSString *videoUrl = [NSString stringWithCString:url.utf8().get_data() encoding:NSUTF8StringEncoding];
    [SwiftClass share_video_web:videoUrl];
}

GodotShare::GodotShare() {
    ERR_FAIL_COND(instance != NULL);
    instance = this;
}

GodotShare::~GodotShare(){}
