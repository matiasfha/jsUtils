#Clase de utilidades para manejo de fechas
#Puede formatear fechas y obtener desde un string json .Net (DateTime desde C#)
#Ej: 
# d = new Date()
# f = DateUtils.get(d).format('dd/mm/yy hh:mm:ss')
class DateUtils
	constructor: (@date) ->
		if Object.prototype.toString.call(@date) == '[object Date]'
			@dd = @date.getDate()
			@mm = @date.getMonth() + 1
			@yy = @date.getFullYear()
			@hh = @date.getHours()
			@mi = @date.getMinutes()
			@ss = @date.getSeconds()


	@get: (date) ->
		new @ date


	#Formatea un objeto Date (JS) a el formato dado por parametro
	format: (format) =>
		if Object.prototype.toString.call(@date) == '[object Date]'
			switch format
				when 'dd/mm/yy'
					@toDMY()
				when 'dd/mm/yy hh:mm:ss'
					@toDMYHMS()
				when 'yy/mm/dd'
					@toYMD()
				when 'yy/mm/dd hh:mm:ss'
					@toYMDHMS()
		else
			null
	
	#Convierte a objeto Date (JS) un string proveniente por ejemplo
	#Desde un DateTime C# /Date(123543534)/
	toJS: () =>
		if date?
			re = /-?\d+/
			m = re.exec(date)
			if m.length > 0
				new Date(parseInt(m[0]))
			else
				null 
		else
			null




	toDMY: () =>
		fecha = "#{@dd}/#{@mm}/#{@yy}" 

	toDMYHMS: () =>
		fecha = "#{@dd}/#{@mm}/#{@yy} #{@hh}:#{@mi}:#{@ss}" 

	toYMD: () =>
		fecha = "#{@yy}/#{@mm}/#{@dd}"

	toYMDHMS: () =>
		fecha = "#{@yy}/#{@mm}/#{@dd} #{@hh}:#{@mi}:#{@ss}" 
