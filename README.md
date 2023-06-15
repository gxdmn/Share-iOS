

# Requirements
Xcode
xcode command line tools
scons

## Download Official Godot Source code
Run the `./download_godot.sh` file on your terminal. The script will download the godot source code in `godot` folder and will generate header files.

## Compile Plugin
Run the `compile_and_copy.sh` file on your terminal:

```bash
./compile_and_copy.sh
```

## Copy Files
Copy the generated files `*.gdip` and `*.xcframework` from the `plugin` directory into your Godot project's `ios/plugins` directory.

## Activate Plugin in Godot
Enable the plugin by going to `Project` → `Export` → `(ios Project)` → `Plugins` and check the "Godot Share" checkbox.

## Use Plugin
Use the following code in your Godot project's `_ready` function:

```gdscript
if Engine.has_singleton("GodotShare"):
    var gshare = Engine.get_singleton("GodotShare")
    # This is a test function to check if the plugin is working correctly or not.
    var result = gshare.function_demo(101) # should return 202
    $Label.text = str(result)
```
## API
```
// path -> path location respective to "user://" directory. If you want to share user://godot.png", pass "godot.png" as path
share_img(path)
share_img_web(url)
```
