###
BodymovinLayer
-
Implementation of Hernan Torrisi's "Bodymovin" plugin, for Framer.
by @72mena
###

class exports.BodymovinLayer extends Layer

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
			print "From BodymovinLayer: Setting a path to your json file is required."
		if @name is ""
			print "From BodymovinLayer: The 'name' attribute is required."

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

		bodymovinSettings =
			container: _container,
			path: @path,
			renderer: @renderer,
			autoplay: @autoplay,
			loop: @loop

		@_animationLayer = bodymovin.loadAnimation(bodymovinSettings);
		@setSpeed()
		@setDirection()

	play: () ->
		@_animationLayer.play()
	stop: () ->
		@_animationLayer.stop()
	pause: () ->
		@_animationLayer.pause()
	setSpeed: (speed) ->
		speed ?= @speed
		@_animationLayer.setSpeed(speed)
	setDirection: (direction) ->
		direction ?= @direction
		@_animationLayer.setDirection(direction)
