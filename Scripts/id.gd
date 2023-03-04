extends Node


enum id_pieces{
	ballon=0,
	bouchon=1,
	cable=2,
	chaudiere=3,
	combustible=4,
	conduitVapeur=5,
	coque_sup=6,
	coque_inf=7,
	coque_avant=8,
	eau=9,
	eau2=10,
	eau3=11,
	entonnoir=12,
	ferAsouder=13,
	goupille=14,
	moteur=15,
	piques=16,
	reservoir=17,
	resistance=18,
	sodium=19,
	sodium2=20,
	sodium3=21,
	turbine=22,
	chaudiere_ouverte=23,
	coque_avant_sup_l=24,
	coque_avant_sup_r=25,
	coque_avant_inf_l=26,
	coque_avant_inf_r=27
}

var dependancies = {
	id_pieces.coque_sup: [],
	id_pieces.coque_inf: [id_pieces.coque_sup],
	id_pieces.ballon: [id_pieces.coque_inf],
	id_pieces.bouchon: [id_pieces.sodium3],
	id_pieces.cable: [id_pieces.moteur,id_pieces.turbine],
	id_pieces.chaudiere: [id_pieces.coque_inf],
	id_pieces.combustible: [id_pieces.chaudiere_ouverte],
	id_pieces.conduitVapeur: [id_pieces.eau3,id_pieces.turbine],
	id_pieces.coque_avant: [id_pieces.conduitVapeur,id_pieces.goupille,id_pieces.combustible],
	id_pieces.eau: [id_pieces.reservoir],
	id_pieces.goupille: [id_pieces.bouchon],
	id_pieces.moteur: [id_pieces.coque_inf],
	id_pieces.piques: [id_pieces.coque_sup, id_pieces.coque_inf],
	id_pieces.reservoir: [id_pieces.chaudiere],
	id_pieces.resistance: [id_pieces.cable],
	id_pieces.sodium: [id_pieces.entonnoir],
	id_pieces.sodium2: [id_pieces.sodium],
	id_pieces.sodium3: [id_pieces.sodium2],
	id_pieces.turbine: [id_pieces.coque_inf],
	id_pieces.coque_avant_sup_l: [id_pieces.conduitVapeur,id_pieces.goupille,id_pieces.combustible],
	id_pieces.coque_avant_sup_r: [id_pieces.conduitVapeur,id_pieces.goupille,id_pieces.combustible],
	id_pieces.coque_avant_inf_l: [id_pieces.conduitVapeur,id_pieces.goupille,id_pieces.combustible],
	id_pieces.coque_avant_inf_r: [id_pieces.conduitVapeur,id_pieces.goupille,id_pieces.combustible]
}

var state_dependencies = {
	id_pieces.ballon: false,
	id_pieces.bouchon: false,
	id_pieces.cable: false,
	id_pieces.chaudiere: false,
	id_pieces.combustible: false,
	id_pieces.conduitVapeur: false,
	id_pieces.coque_avant: false,
	id_pieces.coque_sup: true,
	id_pieces.coque_inf: false,
	id_pieces.eau: false,
	id_pieces.eau2: false,
	id_pieces.eau3: false,
	id_pieces.entonnoir: false,
	id_pieces.goupille: false,
	id_pieces.moteur: false,
	id_pieces.piques: false,
	id_pieces.reservoir: false,
	id_pieces.resistance: false,
	id_pieces.sodium: false,
	id_pieces.sodium2: false,
	id_pieces.sodium3: false,
	id_pieces.turbine: false,
	id_pieces.chaudiere_ouverte: false,
	id_pieces.coque_avant_sup_l: false,
	id_pieces.coque_avant_sup_r: false,
	id_pieces.coque_avant_inf_l: false,
	id_pieces.coque_avant_inf_r: false
}

var drag_and_drop_taken := false

signal tapis_roulant_descendre
signal tapis_roulant_monter
