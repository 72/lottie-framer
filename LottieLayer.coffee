###
LottieLayer
-
Implementation of Hernan Torrisi & AirBnb "Lottie-Web" for Framer.
by @72mena
###

# INCLUDE LIBRARY ———————————————————————————
insertScript = (localScript, webScript, name = 'JavaScript Library') ->
	try
		lib = Utils.domLoadDataSync localScript
		console.log "%c#{name} Successfully Included Locally", "background: #DDFFE3; color: #007814"
	catch e
		try
			lib = Utils.domLoadDataSync webScript
			console.log "%c#{name} Successfully Included from Web", "background: #DDFFE3; color: #007814"
		catch e
			throw Error("Sorry, I couldn't load #{name}")


	script = document.createElement "script"
	script.type = "text/javascript"
	script.innerHTML = lib

	head = document.getElementsByTagName("head")[0]
	head.appendChild script

	script

insertScript("modules/lottie.min.js", "https://raw.githubusercontent.com/airbnb/lottie-web/master/build/player/lottie.min.js", "lottie-web")


# LOTTIE LAYER ———————————————————————————
class exports.LottieLayer extends Layer

	@define "speed",
		get: -> @_properties["speed"]
		set: (value) ->
			@_properties["speed"] = value
			@setSpeed(value) if @built
			@emit "change:speed"

	@define "direction",
		get: -> @_properties["direction"]
		set: (value) ->
			@_properties["direction"] = value
			@setDirection(value) if @built
			@emit "change:direction"

	@define "path",
		get: -> @_properties["path"]
		set: (value) ->
			@_properties["path"] = value
			@setSettings() if @built
			@emit "change:path"


	constructor: (@options={}) ->
		# Defaults
		@options.backgroundColor ?= null
		@options.path ?= null
		@options.autoplay ?= true
		@options.loop ?= true
		@options.speed ?= 1
		@options.direction ?= 1
		@options.renderer ?= "svg"

		super @options

		if @options.path is null
			print "From LottieLayer: Setting a path to your json file is required."
		if @name is ""
			print "From LottieLayer: The 'name' attribute is required."

		#Shortcuts
		@autoplay = @options.autoplay
		@loop = @options.loop
		@renderer = @options.renderer

		#Vars
		@built = false
		@_animationLayer = null

		#Run
		@build()

	build: () ->
		@html = '<div id='+"#{@name}"+'></div>'
		@setSettings()
		@built = true

	setSettings: () ->
		_container = document.getElementById(@name)
		_container.innerHTML = ""

		lottieSettings =
			container: _container,
			path: @path,
			renderer: @renderer,
			autoplay: @autoplay,
			loop: @loop

		@_animationLayer = lottie.loadAnimation(lottieSettings);
		@setSpeed()
		@setDirection()

	play: () ->
		@_animationLayer.play()
	stop: () ->
		@_animationLayer.stop()
	pause: () ->
		@_animationLayer.pause()
	goToAndPlay: (value, isFrame) ->
		isFrame ?= true
		@_animationLayer.goToAndPlay(value, isFrame)
	goToAndStop: (value, isFrame) ->
		isFrame ?= true
		@_animationLayer.goToAndStop(value, isFrame)
	playSegments: (segments, forceFlag) ->
		forceFlag ?= true
		@_animationLayer.playSegments(segments, forceFlag)
	setSpeed: (speed) ->
		speed ?= @speed
		@_animationLayer.setSpeed(speed)
	setDirection: (direction) ->
		direction ?= @direction
		@_animationLayer.setDirection(direction)
	onComplete: (callback) ->
		if @loop
			@_animationLayer.addEventListener "loopComplete", callback
		else
			@_animationLayer.addEventListener "complete", callback
