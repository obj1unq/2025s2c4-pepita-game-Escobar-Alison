import wollok.game.*
import direcciones.*
import pepita.*
import extras.*
import comidas.*

object nivel1 {
	method inicializar() {
        
        game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(alpiste)
		game.addVisual(manzana)

		game.addVisual(pepita)

        game.addVisual(muro) //EL orden de agregar visuales IMPORTA! Siempre, el último, está encima.

	    keyboard.up().onPressDo( { pepita.mover(arriba) } )
	    keyboard.down().onPressDo( { pepita.mover(abajo) } )
	    keyboard.left().onPressDo( { pepita.mover(izquierda) } )
	    keyboard.right().onPressDo( { pepita.mover(derecha) } )
	    //keyboard.c().onPressDo( { pepita.comerAca() } )
                    //Agrega un bloque que se ejecutará siempre que se presione self.

        
        /* COLISION
        game.onCollideDo(pepita, { algo => pepita.encontraste(algo) }) 
        cuando en una interacción entre objetos
        */
	}
}