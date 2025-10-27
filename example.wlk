//Golosinas
class Bombon {
  var peso = 15

  method precio() = 5
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
object melon {}

class Alfajor {
  var peso = 300
  method precio() = 12
  method sabor() = chocolate
  method esLibreDeGluten() = false
  method recibirMordisco() {
    peso = peso * 0.8
  }
  method peso() = peso
}

class Caramelo {
  var peso = 5
  method precio() = 1
  method sabor() = frutilla
  method esLibreDeGluten() = true
  method recibirMordisco() {
    peso = peso - 1
  }
  method peso() = peso
}

class Chupetin {
  var peso = 7

  method precio() = 2
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
  
  method precio() = 5
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
  var pesoActual = 0

  method precio() = 0.5 * pesoInicial
  method sabor() = chocolate
  method esLibreDeGluten() = false
  method recibirMordisco() {pesoActual = pesoActual - 2}
  method peso() = pesoInicial
}

class GolosinaBaniada {
  var golosinaBase
  var pesoBanio = 4

  method golosinaInterior(unaGolosina) { golosinaBase = unaGolosina }
  method peso() = golosinaBase.peso() + pesoBanio
  method precio() = golosinaBase.precio() + 2
  method sabor() = golosinaBase.sabor()
  method esLibreDeGluten() = golosinaBase.esLibreDeGluten()
  method recibirMordisco() {
    golosinaBase.recibirMordisco()
    pesoBanio = (pesoBanio - 2).max(0) 
  }
}

class PastillaTuttifrutti {
	var property libreDeGluten
	const sabores = [frutilla, chocolate, naranja, vainilla]
	var saborActual = 0
	
	method mordisco() { saborActual += 1 }	
	method sabor() { return sabores.get(saborActual % 4) }	
	method precio() { return (if(self.esLibreDeGluten()) 7 else 10) }
	method peso() { return 5 }
	method esLibreDeGluten() { return libreDeGluten }	
}

//Mariano
object mariano {
  const property golosinasCompradas = []

  method comprar(unaGolosina) {
    golosinasCompradas.add(unaGolosina)
  }
  method desechar(unaGolosina) {
    golosinasCompradas.remove(unaGolosina)
  }
  method cantidadDeGolosinas() = golosinasCompradas.size()
  method tieneLaGolosina(unaGolosina) = golosinasCompradas.contains(unaGolosina)
  method probarGolosinas() {
    golosinasCompradas.forEach({g => g.recibirMordisco()})
  }
  method hayGolosinaSinTACC() = golosinasCompradas.any({g => g.esLibreDeGluten()})
  method preciosCuidados() = golosinasCompradas.all({g => g.precio() <= 10})
  method golosinaDeSabor(unSabor) = golosinasCompradas.find({g => g.sabor() == unSabor})
  method golosinasDeSabor(unSabor) = golosinasCompradas.filter({g => g.sabor() == unSabor})
  method sabores() = golosinasCompradas.map({g => g.sabor()}).toSet()
  method golosinaMasCara() = golosinasCompradas.max({g => g.precio()})
  method pesoGolosinas() = golosinasCompradas.sum({g => g.peso()})
  method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.filter({g => !golosinasCompradas.contains(g)})
  method gustosFaltantes(gustosDeseados) = gustosDeseados.difference(golosinasCompradas.map({g => g.sabor()}))
}