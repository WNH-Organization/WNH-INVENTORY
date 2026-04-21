# Makefile for WNH Ledger

.PHONY: dev build clean

# Run the local development server (auto-reloads on save)
dev:
	hugo server -D

# Compile the final static HTML/CSS into the /public directory
build:
	hugo --minify

# Add a new hardware donation
add:
	./new_donation.sh

# Clean up the generated files
clean:
	rm -rf public/
