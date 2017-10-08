class Planeta{
	var listaDePersonas = []
	method calcularPoderPlaneta(){
		return listaDePersonas.sum({habitante => habitante.poder()})
	}
	
	method las3PersonasMasPoderosas(){
		var listaDeLas3PersonasConMayorPoder
		listaDeLas3PersonasConMayorPoder = listaDePersonas.sortBy({habitante => habitante.poder()})
		listaDeLas3PersonasConMayorPoder = listaDePersonas.take(3)
		return listaDeLas3PersonasConMayorPoder.sum({habitante => habitante.poder()})
	}
	method poseeOrden(){
		return self.las3PersonasMasPoderosas() > self.calcularPoderPlaneta()/2
	}
}

class Habitante{
	var valentia
	var inteligencia

	constructor(cuantaValentia, cuantaInteligencia) {
		valentia = cuantaValentia
		inteligencia = cuantaInteligencia
	}
	method poder(){
		return valentia * inteligencia
	}
}

class Soldado inherits Habitante{
	var listaArmas = []
	constructor(cuantaValentia, cuantaInteligencia,armas) = super(cuantaValentia, cuantaInteligencia){
		listaArmas = armas
	}
	override method poder(){
		
		//podria ser super() + listaArmas..
		return valentia*inteligencia + listaArmas.sum({arma=>arma.potencia()})
	}
}

class Arma{
	var potencia
	constructor(potenciaArma){
		potencia = potenciaArma
	}
	method potencia(){
		return potencia
	}
}

class SableDeLuz{
	var energia
	constructor(potenciaSable){
		energia = potenciaSable
	}
	method potencia(){
		return energia
	}
}
class Maestro inherits Habitante{
	var midiclorianos
	var ladoDeLaFuerza
	var sable
	constructor(cuantaValentia, cuantaInteligencia,sableDeLuz,cantMidiclorianos,ladoFuerza) = super(cuantaValentia, cuantaInteligencia){
		midiclorianos = cantMidiclorianos
		ladoDeLaFuerza = ladoFuerza
		sable = sableDeLuz
	}
	method vivirSituacion(situacion){
		ladoDeLaFuerza.vivirSituacion2(situacion, self)
	}
	override method poder(){
		return super() + midiclorianos/1000 + ladoDeLaFuerza.potenciaSable(sable)			
		}
	method ladoDeLaFuerza(ladoFuerza){
		ladoDeLaFuerza = ladoFuerza
	}
	method deQueLadoEsta(){
		return ladoDeLaFuerza
	}
	}
	
class LadoDeLaFuerza{
	var tiempoQuePaso = 0
	method vivirSituacion2(situacion,maestro){
		tiempoQuePaso+=1
		self.aceptarSituacion(situacion,maestro)
	}
	method aceptarSituacion(situacion, maestro)
}

class LadoOscuro inherits LadoDeLaFuerza{
	var odio = 1000
	method aumentarOdio(){
		odio+= odio*0.10
	}
	override method aceptarSituacion(situacion,maestro){
		if (situacion.cargaEmocional() > odio){
			maestro.ladoDeLaFuerza(new LadoDeLaLuz())}
		else{
			self.aumentarOdio()	
		}
	}
	method potenciaSable(sable){
		return sable.potencia() *2 + tiempoQuePaso
	}
}

class LadoDeLaLuz inherits LadoDeLaFuerza{
	var pazInterior = 1000
	method alterarPazInterior(valor) {
		pazInterior = pazInterior + valor	
	}
	override method aceptarSituacion(situacion,maestro){
		self.alterarPazInterior(situacion.cargaEmocional())
		if (pazInterior <= 0){
			maestro.ladoDeLaFuerza(new LadoOscuro())}
			}
	method potenciaSable(sable){
		return sable.potencia() * tiempoQuePaso
	}	
}

class Situacion{
	var cargaEmocional
	constructor(pesoCargaEmocional){
		cargaEmocional = pesoCargaEmocional
	}
	method cargaEmocional(){
		return cargaEmocional
	}
}
