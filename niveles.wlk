import pepita.*
import extras.*
import comidas.*
import direcciones.*
import wollok.game.*

object nivel1 {
	method inicializar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(alpiste)
		game.addVisual(manzana)

		game.addVisual(pepita)

		keyboard.up().onPressDo { pepita.mover(arriba) }
		keyboard.down().onPressDo { pepita.mover(abajo) }
		keyboard.left().onPressDo { pepita.mover(izquierda) }
		keyboard.right().onPressDo { pepita.mover(derecha) }
		
		//game.onTick(800) { pepita.caer() } // Tick para que Pepita caiga
        
		game.onCollideDo(pepita, { algo => pepita.sobreAlguien() })
	}
}

object admin {
	method perder() {
		game.say(pepita, "Perdiste, presiona R para reiniciar")
		keyboard.r().onPressDo {
			game.clear()
			nivel1.inicializar()
			pepita.inicializar()
		}
	}

	method ganar() {
		game.stop()
	}
}