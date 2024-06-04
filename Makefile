# Объединение файлов Markdown в один файл
combine:
	cat markdown-files/*.md > The-100-Year-QA-Textbook.md

# Очистка собранных файлов
clean:
	rm -f The-100-Year-QA-Textbook.md