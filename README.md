# godot-pixel-eyes-follow
Eyes that follow the mouse or a Node that you define via ".target" on the eyes. You can just drop them into the scene as they are. Maybe you have to define the textures again.

## How to use
- Add the Textures + the Eye.tscn and Eye.gd to your project.
- Make sure the textures in the Eye.tscn are set correctly (orientation is the eye pupil)
- now you can just drop the Eye into any scene that you like. You can resize it via scaling (the base-texture is only 4 pixels, so scale = 1 would be near invisible)

## Using the Eye-Tracking
The Eye tracking can be used in 3 different ways:
1. target: you can set this by either in the Eye node in the inspector or by code. The Eye will then track the entity given
2. eye_master: set this in the editor-inspector or via code. you can have the eye sync up with another eye, to prevent cross-eyedness or to create other (hopefully weird) effects
3. follow mouse: When you dont set a target or no eye_master, the eye will follow your mouse.
