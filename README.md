# pyinstaller-docker-buildtool
Build a highly compatible linux binary from your python script using docker-compose.

Based on Debian Stretch, for maximum compatibility. Provides the latest version of Python (3.8.2).

In its current form, a Github repository is downloaded and built, then written to a filename versioned according to the 
repository's latest tag. Edit `code/build.sh` to alter the source.

To build, simply run `docker-compose up` in the repository's root directory.