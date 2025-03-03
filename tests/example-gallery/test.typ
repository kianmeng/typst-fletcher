#set page(width: auto, height: auto, margin: 1em)
#import "/src/exports.typ" as fletcher: diagram, node, edge

#[
	#diagram(cell-size: 15mm, $
		G edge(f, ->) edge("d", pi, ->>) & im(f) \
		G slash ker(f) edge("ur", tilde(f), "hook-->")
	$)
]

#pagebreak()

#[
	#import fletcher.shapes: diamond

	#diagram(
		node-stroke: 1pt,
		edge-stroke: 1pt,
		node((0,0), [Start], corner-radius: 2pt, extrude: (0, 3)),
		edge("-|>"),
		node((0,1), align(center)[
			Hey, wait,\ this flowchart\ is a trap!
		], shape: diamond),
		edge("d,r,u,l", "-|>", [Yes], label-pos: 0.1)
	)
]

#pagebreak()

#[
	#diagram(
		node-stroke: .1em,
		node-fill: gradient.radial(blue.lighten(80%), blue, center: (30%, 20%), radius: 80%),
		spacing: 4em,
		edge((-1,0), "r", "-|>", `open(path)`, label-pos: 0, label-side: center),
		node((0,0), `reading`, radius: 2em),
		edge(`read()`, "-|>"),
		node((1,0), `eof`, radius: 2em),
		edge(`close()`, "-|>"),
		node((2,0), `closed`, radius: 2em, extrude: (-2.5, 0)),
		edge((0,0), (0,0), `read()`, "--|>", bend: 130deg),
		edge((0,0), (2,0), `close()`, "-|>", bend: -40deg),
	)
]

#pagebreak()

#[
	#diagram($
		e^- edge("rd", "-<|-") & & & edge("ld", "-|>-") e^+ \
		& edge(gamma, "wave") \
		e^+ edge("ru", "-|>-") & & & edge("lu", "-<|-") e^- \
	$)
]

#pagebreak()

#[
	#import fletcher.shapes: house, hexagon
	#set text(font: "Fira Sans")

	#let blob(pos, label, tint: white, ..args) = node(
		pos, align(center, label),
		width: 26mm,
		fill: tint.lighten(60%),
		stroke: 1pt + tint.darken(20%),
		corner-radius: 5pt,
		..args,
	)

	#diagram(
		spacing: 8pt,
		cell-size: (8mm, 10mm),
		edge-stroke: 1pt,
		edge-corner-radius: 5pt,
		mark-scale: 70%,

		blob((0,1), [Add & Norm], tint: yellow, shape: hexagon),
		edge(),
		blob((0,2), [Multi-Head Attention], tint: orange),
		blob((0,4), [Input], shape: house.with(angle: 30deg),
			width: auto, tint: red),

		for x in (-.3, -.1, +.1, +.3) {
			edge((0,2.8), (x,2.8), (x,2), "-|>")
		},
		edge((0,2.8), (0,4)),

		edge((0,3), "l,uu,r", "--|>"),
		edge((0,1), (0, 0.35), "r", (1,3), "r,u", "-|>"),
		edge((1,2), "d,rr,uu,l", "--|>"),

		blob((2,0), [Softmax], tint: green),
		edge("<|-"),
		blob((2,1), [Add & Norm], tint: yellow, shape: hexagon),
		edge(),
		blob((2,2), [Feed Forward], tint: blue),
	)
]