.PHONY: generate_pdf

input_file = curriculum-vitae.md
output_file = curriculum-vitae.pdf
margin = 20
pdf_options = -V margin-top=${margin}\
	-V margin-left=${margin}\
	-V margin-right=${margin}\
	-V margin-bottom=${margin}
generate = pandoc -t html5 ${pdf_options} \
	--css="style.css" \
	${input_file} \
	-o ${output_file}

generate_pdf: style.css ${input_file}
	${generate}
	${generate}
