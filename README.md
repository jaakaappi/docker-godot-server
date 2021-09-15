# docker-godot-server

Docker builds for [Godot Engine](https://godotengine.org/) (server)

The entrypoint calls the Godot Engine server (`/usr/local/bin/godot`) so override the `command` with any arguments.

## Usage Example

See the attached `docker-compse.yml`, configure the `game.pck` to match your needs or change it to `./:.` to mount the whole host folder as a volume.

Running the compose file:
```
docker-compose up --build
```

Building the image if needed: 
```
docker build -t godot-server:latest .
```

## Docker Tags

The tags follow the Godot version and allow for different export template installs (for filesize). When in doubt use the base version (ex. 3.3.3) which includes all templates provided by Godot.

- `3.3.3`, `latest`