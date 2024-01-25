extends Node2D

func play_idle_animation():
	%AnimationPlayer.play("Idle")

func play_acceleration_animation():
	%AnimationPlayer.play("RunStart")

func play_run_animation():
	%AnimationPlayer.play("Loop")
