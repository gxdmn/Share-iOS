#import "GodotShare.h"

#include "GodotShareHelper.h"
#include "core/config/engine.h"

GodotShare *plugin;

void godot_share_init(){
    plugin = memnew(GodotShare);
    Engine::get_singleton()->add_singleton(Engine::Singleton("GodotShare", plugin));
}

void godot_share_deinit(){
    if (plugin){
        memdelete(plugin);
    }
}
