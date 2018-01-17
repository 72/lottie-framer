# Lottie for Framer
A Framer module that uses AirBnb's Lottie-Web to render animations exported from After Effects (JSON files).


# 🚀 [View Demo](https://framer.cloud/lZjXF/)

## Installation

1. Create a new Framer project.
2. Download and put the file [`LottieLayer.coffee`](https://raw.githubusercontent.com/72/lottie-framer/master/LottieLayer.coffee) in your modules folder.
3. *Recommended:* Download the [`lottie.min.js`](https://raw.githubusercontent.com/airbnb/lottie-web/master/build/player/lottie.min.js) library and put it in your modules folder.
4. Add this line at the top of your Framer document.
```coffeescript
{LottieLayer} = require 'LottieLayer'
```


## How to use

Create a new instance of this module.
```coffeescript
customAnim = new LottieLayer
	name: "customAnim"
	path: "images/animation.json"
```
That's it! This creates an element bundled with all the goodies of a Framer Layer **and** the methods of a lottie-web animation instance.


### Customization

```coffeescript
customAnim = new LottieLayer
	name: "customAnim"
	path: "images/animation.json"
	autoplay: true
	loop: true
	speed: 1
	direction: 1
```

- `name` *String* **Required** : Sets the name of the instance. Each instance must have a different name.
- `path` *String* **Required** : Sets the path to your JSON file.
- `autoplay` *Boolean* : Whether or not to autoplay the animation once it's loaded. Defaults to true.
- `loop` *Boolean or Number* : Whether or not to loop the animation. If you pass a number, the animation will loop that many times. Defaults to true.
- `speed` *Number* : Sets the speed of the animation. 1 is normal speed. 2 is double the speed and so on. Defaults to 1.
- `direction` *Number* : Sets the direction of the animation. 1 will play the animation forward. -1 will play the animation backwards. Defaults to 1.


### Methods

**.play()**

**.pause()**

**.stop()**

The animation needs to be loaded in the DOM before running these 3 methods:

**.goToAndStop( _frame_ )**

**.goToAndPlay( _frame_ )**

**.playSegments([ _fromFrame_, _toFrame_ ])**


### Events

Examples of available events:

```coffeescript
customAnim.onLoaded ->
	print 'Loaded in the DOM'
	#Do something else
```

```coffeescript
customAnim.onComplete ->
	print 'Completed.'
	#Do something else
```

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

## Notes

Download lottie-web-ready animations.
- [Lottie Files](http://www.lottiefiles.com/)

Learn more about Bodymovin & Lottie-Web.
- [Lottie-web official repo](https://github.com/airbnb/lottie-web)
- [Bodymovin installation guide by Valentina Berois](https://medium.com/@vberois/lottie-after-effects-591913cb004c)

Thanks to Hernan Torrisi for the amazing work on the bodymovin plugin and to @mhotovec, @slykuiper and @MVHarvey for their animations used in the demo.

## Contact
[@72mena](http://twitter.com/72mena)
