#ifndef GodotShareHelper_h
#define GodotShareHelper_h

#include "core//version.h"
#include "core/object/class_db.h"

class GodotShare : public Object {
    GDCLASS(GodotShare, Object);
    static GodotShare *instance;
    static void _bind_methods();
public:
    int function_demo(int i);
    void signal_demo(String s);
    void share_img(String path);
    void share_img_web(String url);

    void share_video_web(String url);
    
    static GodotShare *get_singleton();
    GodotShare();
    ~GodotShare();
};


#endif /* GodotShareHelper_h */
