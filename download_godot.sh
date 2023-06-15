#!/bin/bash

repo_url="https://github.com/godotengine/godot"

tag="4.0-stable"

git clone --branch "$tag" "$repo_url"

cd godot

timeout 10s scons p=ios target=template_debug
