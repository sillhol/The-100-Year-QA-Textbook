# Объединение файлов Markdown в один файл
combine:
	find . -maxdepth 1 -type f -name "*.md" -not -name The-100-Year-QA-Textbook.md -print0 | xargs -0 cat > The-100-Year-QA-Textbook.md