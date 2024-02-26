extends Node

@export var enemy_scene: PackedScene
var score

func new_game():
	get_tree().call_group(&"mobs", &"queue_free")
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.show_message("Prepare!")
	#ESTE ES UN MENSAJE
	#ESTE ES OTRO MENSAJE
	
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_timer_timeout():
	$EnemyTimer.start()
	$ScoreTimer.start()
	pass # Replace with function body.


func _on_score_timer_timeout():
	score += 1
	#print(score)
	$HUD.update_score(score)
	pass # Replace with function body.


func _on_enemy_timer_timeout():
	#Crear una instancia nueva del enemigo
	var mob = enemy_scene.instantiate()
	
	#Escoger un lugar aleatorio para que aparezca
	var mob_spawn_location = get_node("Path2D/SpawnEnemy")
	mob_spawn_location.progress = randi()
	
	#seleccionar la dirección del enemigo
	var direction = mob_spawn_location.rotation + PI /2
	
	mob.position = mob_spawn_location.position
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	
	
	
	pass # Replace with function body.







