import wollok.game.*
import pepita.*

object nido{
    const property position = game.at(8, 8)
    method image() = "nido.png"

    method chocarConPepita(unaPepita) {
        unaPepita.gane()
    }
}

object silvestre{
    const presa = pepita

    method image() = "silvestre.png"

    method position() = game.at(self.x(), 0)

    method x() = 3.max(presa.position().x()) //presa.position().x().max(3)

    method chocarConPepita(unaPepita) {
        unaPepita.teAtraparon()
    }

}

object muro {
    const property position = game.at(2, 0)

    method image() = "muro.png"
}