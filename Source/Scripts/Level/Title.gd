extends Node2D

export var music = preload("res://Audio/Soundtrack/9. SWD_TitleScreen.ogg")
export var speed = 0
var titleEnd = false

func _ready():
	yield(get_tree(),"idle_frame")
	Global.music.stream = music
	Global.music.play()

func _process(delta):
	$BackCog.rotate(delta*speed)
	$BigCog.rotate(-delta*2*speed)
	$BigCog/CogCircle.rotate(delta*2*speed)
	$Sonic/Cog.rotate(-delta*1.5*speed)
	

func _input(event):
	if event.is_action_pressed("gm_pause") && !titleEnd:
		titleEnd = true
		if Global.music.get_playback_position() < 14.0:
			Global.music.seek(14.0)
		Global.main.change_scene(Global.nextZone,"FadeOut","FadeOut","SetSub",1)
		$Celebrations.emitting = true
