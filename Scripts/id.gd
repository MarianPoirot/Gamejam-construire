extends Node

enum id_pieces{
	ballon,
	bouchon,
	cable,
	chaudiere,
	combustible,
	conduitVapeur,
	coque_sup,
	coque_inf,
	coque_avant,
	eau,
	entonnoir,
	ferAsouder,
	goupille,
	moteur,
	piques,
	reservoir,
	resistance,
	sodium,
	sodium2,
	sodium3,
	turbine
}

var dependancies = {
	id_pieces.coque_sup: [],
	id_pieces.coque_inf: [id_pieces.coque_sup],
	id_pieces.ballon: [id_pieces.coque_inf],
	id_pieces.bouchon: [id_pieces.sodium3],
	id_pieces.cable: [id_pieces.moteur,id_pieces.turbine],
	id_pieces.chaudiere: [id_pieces.coque_inf],
	id_pieces.combustible: [id_pieces.chaudiere],
	id_pieces.conduitVapeur: [id_pieces.eau,id_pieces.turbine],
	id_pieces.coque_avant: [id_pieces.conduitVapeur,id_pieces.goupille,id_pieces.resistance,id_pieces.combustible],
	id_pieces.eau: [id_pieces.reservoir],
	id_pieces.goupille: [id_pieces.bouchon],
	id_pieces.moteur: [id_pieces.coque_inf],
	id_pieces.piques: [id_pieces.coque_sup, id_pieces.coque_inf],
	id_pieces.reservoir: [id_pieces.chaudiere],
	id_pieces.resistance: [id_pieces.cable],
	id_pieces.sodium: [id_pieces.entonnoir],
	id_pieces.sodium2: [id_pieces.sodium],
	id_pieces.sodium3: [id_pieces.sodium2],
	id_pieces.turbine: [id_pieces.coque_inf]
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
	id_pieces.entonnoir: false,
	id_pieces.goupille: false,
	id_pieces.moteur: false,
	id_pieces.piques: false,
	id_pieces.reservoir: false,
	id_pieces.resistance: false,
	id_pieces.sodium: false,
	id_pieces.sodium2: false,
	id_pieces.sodium3: false,
	id_pieces.turbine: false
}

var drag_and_drop_taken := false
