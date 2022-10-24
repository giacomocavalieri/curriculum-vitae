.PHONY: generate_pdf

file_name = cv
margin = 20
pdf_options = -V margin-top=${margin}\
	-V margin-left=${margin}\
	-V margin-right=${margin}\
	-V margin-bottom=${margin}
generate = pandoc -t html5 ${pdf_options} \
	--css="style.css" \
	${file_name}.md \
	-o ${file_name}.pdf

generate_pdf: style.css ${file_name}.md
	${generate}
	${generate}
