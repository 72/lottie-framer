# Bodymovin for Framer
A module to render JSON files exported with the Bodymovin plugin from After Effects.

> Bodymoving created by Hernan Torrisi and also used by AirBnb's Lottie library.


## Installation

1. Create a new Framer project.
2. Download the [bodymovin plugin](https://raw.githubusercontent.com/bodymovin/bodymovin/master/build/player/bodymovin_light.min.js) and add it to your project and index.html
```html
<script src="js/bodymovin_light.min.js" type="text/javascript"></script>
```
3. Put the file `BodymovinLayer.coffee` in your modules folder.
4. Add this line at the top of your Framer document.
```coffeescript
{BodymovinLayer} = require 'BodymovinLayer'
```


## How to use

Create a new instance of this module.
```coffeescript
customAnim = new BodymovinLayer
	name: "customAnim"
	path: "images/animation.json"
```
That's it! This creates an element bundled with all the benefits of a Framer Layer **and** the methods of a bodymoving animation instance.


### Customization

A description of the attributes you can modify.
```coffeescript
customAnim = new BodymovinLayer
	name: "customAnim"
	path: "images/animation.json"
	autoplay: true
	loop: true
	speed: 1
	direction: 1
```

- `name` *String* **Required** : Sets the name of the instance.
- `path` *String* **Required** : Sets the path to your JSON file.
- `autoplay` *Boolean* : Whether or not to autoplay the animation once it's loaded. Defaults to true.
- `loop` *Boolean or Number* : Whether or not to loop the animation. If you pass a number, the animation will loop that many times. Defaults to true.
- `speed` *Number* : Sets the speed of the animation. 1 is normal speed. 2 is double the speed and so on. Defaults to 1.
- `direction` *Number* : Sets the direction of the animation. 1 will play the animation forward. -1 will play the animation backwards. Defaults to 1.


### Methods

- `customAnim.play()`
- `customAnim.pause()`
- `customAnim.stop()`


### Events

Listen for custom events.

```coffeescript
customAnim.on "change:speed", ->
	print 'Speed changed to: ' + customAnim.speed
	#Do something else
```

```coffeescript
customAnim.on "change:direction", ->
	print 'Direction changed to: ' + customAnim.direction
	#Do something else
```


## [View Demo](https://framer.cloud/GPSqX/)

Plays an animation, and changes its direction on Tap.

#### Demo Code

```coffeescript
{BodymovinLayer} = require 'BodymovinLayer'

customAnim = new BodymovinLayer
	name: "customAnim"
	path: "images/loading.json"
	size: 500

customAnim.center()

# On tap, change direction of animation.
customAnim.onTap ->
	if customAnim.direction isnt 1
		customAnim.direction = 1
	else
		customAnim.direction = -1
```


## Notes

For some reason these bodymovin methods are not working for me. I'll update the module if I find a fix.
- `.goToAndStop()`
- `.goToAndPlay()`
- `.playSegments()`

Download bodymovin-ready animations.
- [Lottie Files](http://www.lottiefiles.com/)

Learn more about Bodymovin.
- [Bodymovin official repo](https://github.com/bodymovin/bodymovin)

## Contact
[@72mena](http://twitter.com/72mena)
