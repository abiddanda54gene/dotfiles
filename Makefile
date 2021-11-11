
# All three operations to easily call
all:
	make unlink; make link; make source;

# Links all dot-files to home
link:
	@ln -f .bash_profile ~/.bash_profile
	@ln -f .bashrc ~/.bashrc
	@ln -f .bash_functions ~/.bash_functions
	@ln -f .bash_aliases ~/.bash_aliases
	@echo "Successfully linked dot-files!"

# Removes links for dot-files from home
unlink:
	@unlink ~/.bash_profile
	@unlink ~/.bashrc
	@unlink ~/.bash_functions
	@unlink ~/.bash_aliases
	@echo "Successfully unlinked dot-files!"

source:
	source ~/.bash_profile
	@echo "Successfully loaded bash-profile!"
