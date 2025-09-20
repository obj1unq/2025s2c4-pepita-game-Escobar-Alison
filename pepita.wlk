import extras.*
import comidas.*
import niveles.*
import wollok.game.*

object pepita {
	const posicionInicial = game.at(0,1)
	const energiaInicial = 100

	var property position = posicionInicial
	var energia = energiaInicial

	const property predador = silvestre
	const hogar = nido
	const joules = 9
	var property atrapada = false

	method text() = "Energia: \n" + energia
	method textColor() = "FF0000"


// --- Apariencia ---
	method image() {
		return "pepita-" + self.estado() + ".png"
	}
	
	method estado() =
		if (!self.puedeVolar()) { "gris" }
		    else if (self.enHogar()) { "grande"  }
			        else { "base" }


	method enHogar() = self.estaSobre(hogar)

	method estaSobre(alguien) = position == alguien.position() 

	// --- Movimientos ---
	method puedeVolar() = energia >= self.energiaNecesaria(1) && not self.atrapada()

	method energiaNecesaria(kms) = joules * kms

	method mover(direccion){
		if(self.puedeVolar()){
			self.volar(1)
			position = direccion.siguiente(position)
		} else {
			self.perdi()
		}
	}

	method volar(kms) {
		energia -= self.energiaNecesaria(kms) 
	}

	method energia() {
		return energia
	}
	
	// Caer sin gastar energía
	method caer() {
		if(not atrapada) {
			position = position.down(1)
		}
	}

//-----------Comer-------------

	method comerAca() {
		const comida = self.loQueHayAca()
		self.comer(comida)
		comida.andate()
	}
	
	method loQueHayAca() = game.uniqueCollider(self) //Devuelve el único objeto que está en la misma posición que el objeto dado (pepita)
	
	method teAtraparon() {
		self.atrapada(true)
		game.say(self, "Me atraparon!")
		self.perdi()
	}

    method sobreAlguien(){
		
	}


//////////////////////////////////////////////////////////////////////////////////////
	method perdi(){
		admin.perder()
	}
	
	method inicializar() {
		position = posicionInicial
		energia = energiaInicial
		atrapada = false
	}
//////////////////////////////////////////////////////////////////////////////////////
	
	method redibujarse(){     //Esto no se usa
	  game.removeVisual(self)
	  game.addVisual(self)
	}
}