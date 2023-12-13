extends Node

var player_speed = 800 #105
const max_laps = 3
var player_score = 0

# Variables for keeping the players scores and amount of correct and incorrect answers
var correct_answers = 0
var incorrect_answers = 0

var enemy_finished = false
var player_finished = false

var victory_string = "Victory!!"
var defeat_string = "Almost beat him!\nKeep trying!"

var levelCounter = 0
