import comidas.*
import wollok.game.*
object pepita {
	var property position = game.at(0,1) 
	var energia = 100

	method image() = "pepita-base.png"

	method text () = "Energia: \n" + energia //
    
	method textColor() = "FF0000"

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

	method reDibujar() {
		game.removeVisual(self)
		game.addVisual(self)
	  
	}

}

