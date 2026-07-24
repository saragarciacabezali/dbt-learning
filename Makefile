# One-time setup: adds the dbt-learning alias to your .zshrc, if it isn't
# already there. Safe to run more than once — won't duplicate the line.
install-alias:
	@if ! grep -qF 'alias dbt-learning=' ~/.zshrc 2>/dev/null; then \
		echo '' >> ~/.zshrc; \
		echo '# Jumps into the dbt-learning project and activates its virtual environment' >> ~/.zshrc; \
		echo 'alias dbt-learning="cd ~/projects/dbt-learning && source .venv/bin/activate"' >> ~/.zshrc; \
		echo "Alias added to ~/.zshrc"; \
	else \
		echo "Alias already present in ~/.zshrc — skipping"; \
	fi
	@echo "Run 'source ~/.zshrc' (or open a new terminal) to start using it."
