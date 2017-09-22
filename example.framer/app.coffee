Style = require 'stylesheet'

styles =
	a:
		backgroundColor: 'blue'
		borderWidth: 3
		borderColor: 'black'
		borderRadius: 5
	b:
		backgroundColor: 'magenta'
		borderWidth: 5
		size: 100
			

layerA = new Layer Style styles.a,
	x: Align.center
	y: Align.center
	backgroundColor: 'cyan'
	
layerB = new Layer Style styles.b, styles.a,
	x: Align.center -100
	y: Align.center -100
	backgroundColor: new Color(styles.b.backgroundColor).alpha(0.8)
