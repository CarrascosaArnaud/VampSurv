extends Node2D

func play_walk():
	%AnimationPlayer.play("Walk")

func play_hurt():
	%AnimationPlayer.play("Hurt")
	%AnimationPlayer.queue("Walk")
