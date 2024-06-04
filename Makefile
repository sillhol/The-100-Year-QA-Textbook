# Объединение файлов Markdown в один файл
combine:
	find . -type f -name "*.md" | grep -v "The-100-Year-QA-Textbook.md" | xargs cat > The-100-Year-QA-Textbook.md