## Shell scripts

This collection of scripts contains various zsh (but mostly based on pure sh) scripts used for automation.

Content:
- python_cli_app_dir_struct.sh:
	#### Usage:
		python_cli_app_dir_struct.sh PROJECT_NAME BASE_DIR
	#### Result:
		Script creates directory and base file structure for Python CLI program in provided base directory. The result looks like this
		BASE_DIR
			app
				requirements.txt
				README.md
				CHANGELOG.md
				install.sh
				setup.py
				.gitignore
				test
					.gitkeep
				docs
					.gitkeep
				logs
					.gitkeep
				
				app
					__init__.py
					__main__.py

		It also populates setup.py and install.sh with default values.

