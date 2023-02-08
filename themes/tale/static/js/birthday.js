
(function() {
	// Use the local time of the client to show based on the timezone of the viewer
	var now = new Date();
	if (now.getMonth() == 2 // 0-indexed, 11 is december
		&& now.getDate() == 17) {
		show_confetti();
		show_support_link();
	}
})();

function show_support_link() {
	const p = document.createElement('p')
	p.innerHTML = "It's my birthday today! 🎊 Fancy <a href='/support-me/'>sponsoring this blog as a present</a>? 🎁";
	const main =
		document.querySelector('main')
	main.prepend(document.createElement('hr'))
	main.prepend(p)
	main.prepend(document.createElement('hr'))
}

function show_confetti() {
	tsParticles.load("tsparticles", {
		"particles": {
			"number": {
				"value": 0
			},
			"color": {
				"value": [
					"#00FFFC",
					"#FC00FF",
					"#fffc00"
				]
			},
			"shape": {
				"type": [
					"circle",
					"square",
					"triangle",
					"polygon"
				],
				"options": {
					"polygon": [
						{
							"sides": 5
						},
						{
							"sides": 6
						}
					]
				}
			},
			"opacity": {
				"value": 1,
				"animation": {
					"enable": true,
					"minimumValue": 0,
					"speed": 2,
					"startValue": "max",
					"destroy": "min"
				}
			},
			"size": {
				"value": 4,
				"random": {
					"enable": true,
					"minimumValue": 2
				}
			},
			"links": {
				"enable": false
			},
			"life": {
				"duration": {
					"sync": true,
					"value": 5
				},
				"count": 1
			},
			"move": {
				"enable": true,
				"gravity": {
					"enable": true,
					"acceleration": 10
				},
				"speed": {
					"min": 10,
					"max": 20
				},
				"decay": 0.1,
				"direction": "none",
				"straight": false,
				"outModes": {
					"default": "destroy",
					"top": "none"
				}
			},
			"rotate": {
				"value": {
					"min": 0,
					"max": 360
				},
				"direction": "random",
				"move": true,
				"animation": {
					"enable": true,
					"speed": 60
				}
			},
			"tilt": {
				"direction": "random",
				"enable": true,
				"move": true,
				"value": {
					"min": 0,
					"max": 360
				},
				"animation": {
					"enable": true,
					"speed": 60
				}
			},
			"roll": {
				"darken": {
					"enable": true,
					"value": 25
				},
				"enable": true,
				"speed": {
					"min": 15,
					"max": 25
				}
			},
			"wobble": {
				"distance": 30,
				"enable": true,
				"move": true,
				"speed": {
					"min": -15,
					"max": 15
				}
			}
		},
		"emitters": {
			"life": {
				"count": 0,
				"duration": 0.1,
				"delay": 0.4
			},
			"rate": {
				"delay": 0.1,
				"quantity": 150
			},
			"size": {
				"width": 0,
				"height": 0
			}
		}
	});
}
