all:
	stow --verbose --target=$$HOME --ignore='*.bak' --restow */

delete:
	@echo "Are you sure you want to delete the symlinks? [y/N] "; \
	read answer; \
	if [ $$answer = y ]; then \
	  stow --verbose --target=$$HOME --delete */; \
	else \
	  echo "Aborted deletion"; \
	fi
