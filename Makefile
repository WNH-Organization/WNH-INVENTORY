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

# Compress all raw images in the hardware directory (requires ImageMagick)
compress:
	find content/hardware/ -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png \) \
	-exec mogrify -resize "1920x1080>" -quality 80 {} +
	@echo "All images crushed to web-friendly sizes."

# Clean up the generated files
clean:
	rm -rf public/
