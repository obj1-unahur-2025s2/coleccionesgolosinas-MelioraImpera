//Golosinas
class Bombon {
  var peso = 15

  method valor() = 5
  method sabor() = frutilla
  method esLibreDeGluten() = true
  method recibirMordisco() {
    peso = (peso * 0.8) - 1
  }
  method peso() = peso
}

//Sabores
object frutilla {}
object chocolate {}
object naranja {}
object vainilla {}

class Alfajor {
  var peso = 300
  method valor() = 12
  method sabor() = chocolate
  method esLibreDeGluten() = false
  method recibirMordisco() {
    peso = peso * 0.8
  }
  method peso() = peso
}

class Caramelo {
  var peso = 5
  method valor() = 1
  method sabor() = frutilla
  method esLibreDeGluten() = true
  method recibirMordisco() {
    peso = peso - 1
  }
  method peso() = peso
}

class Chupetin {
  var peso = 7

  method valor() = 2
  method sabor() = naranja
  method esLibreDeGluten() = true
  method recibirMordisco() {
    if(peso > 2){
      peso = peso * 0.9
    }
  }
  method peso() = peso
}

class Oblea {
  var peso = 250
  
  method valor() = 5
  method sabor() = vainilla
  method esLibreDeGluten() = false
  method recibirMordisco() {
      if(peso > 70) {
        peso = peso * 0.5
      } else {
        peso = peso * 0.75
      }
  }
  method peso() = peso
}

class Chocolatin {
  const pesoInicial
  var pesoActual

  method valor() = 0.5 * pesoInicial
  method sabor() = chocolate
  method esLibreDeGluten() = false
  method recibirMordisco() {pesoActual = pesoActual - 2}
  method peso() = pesoActual
}

class GolosinaBaniada {
  var golosinaBase
  var pesoBanio = 4

  method golosinaInterior(unaGolosina) { golosinaBase = unaGolosina }
  method peso() = golosinaBase.peso() + pesoBanio
  method valor() = golosinaBase.valor() + 2
  method sabor() = golosinaBase.sabor()
  method esLibreDeGluten() = golosinaBase.esLibreDeGluten()
  method recibirMordisco() {
    golosinaBase.recibirMordisco()
    pesoBanio = (pesoBanio - 2).max(0) 
  }
}

class PastillaTuttifrutti {
	var libreDeGluten
	const sabores = [frutilla, chocolate, naranja, vainilla]
	var saborActual = 0
	
	method mordisco() { saborActual += 1 }	
	method sabor() { return sabores.get(saborActual % 4) }	
	method precio() { return (if(self.libreGluten()) 7 else 10) }
	method peso() { return 5 }
	method libreGluten() { return libreDeGluten }	
	method libreGluten(valor) { libreDeGluten = valor }
}