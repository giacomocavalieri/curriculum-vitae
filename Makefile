.PHONY: generate_pdf

input_file = curriculum-vitae.md
html_file = curriculum-vitae.html
output_file = curriculum-vitae.pdf
style_file = style.css

${output_file}: ${html_file} ${style_file}
	wkhtmltopdf ${html_file} --allow ${style_file} ${output_file}

${html_file}: ${input_file} ${style_file}
	pandoc -s ${input_file} -c ${style_file} -o ${html_file}
