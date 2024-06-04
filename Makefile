# Объединение файлов Markdown в один файл
combine:
	cat *.md > The-100-Year-QA-Textbook.md
	
# Очистка содержимого собранного файла
clean:
	echo "" > The-100-Year-QA-Textbook.md