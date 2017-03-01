d3.select('svg').append('text').attr({
  x.50
  y.50
  fill: "black"
  "font-size": 40px
}).text('Loading...')

d3.csv 'test.csv', (error, data)->
  data = data.splice(0, 100) 
  width = 1200
  height = 600
  fill = d3.scale.category20()
  maxcount = d3.max(data, (d) -> d.count)
  wordcount = data.map((d) ->
  	text: d.word
  	size: d.count / maxcount * 10
  )
  d3.layout.cloud().size([
  	width
  	height
  ]).words(wordcount).padding(5).rotate( ->
  	~~(Math.random() * 2) * 90
  ).font("Impact").fontSize((d) ->
  	d.size
  ).on("end", draw).start()

  draw = (words) ->
  	d3.select("body").append("svg").attr(
  	  width: width
  	  height: height
  	).append("g").attr("transform", "translate(" + [
  	  width >> 1
  	  height >> 1
  	] + ")").selectAll("text").data(words).enter().append("text").style(
  	  "font-size": (d) ->
  	  	d.size + "px"
  	  "font-family": "Impact"
  	  fill: (d,i) ->
  	  	fill i
  	).attr(
  	  "text-anchor": "middle"
  	  transform: (d) ->
  	  	"translate(" + [
  	  	  d.x
  	  	  d.y
  	  	] + ")rotate(" + d.rotate + ")"
  	).text (d) ->
  	  d.text