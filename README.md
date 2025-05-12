# C-Gate Docker Server

Docker container for Schneider Electric (Clipsal) C-Gate Server >= 3.4.x



### Ports

- 20023: C-Gate Command Port
- 20024: C-Gate Event Port
- 20025: C-Gate Load Change Port
- 20026: C-Gate Config Change Port
- 20123: C-Gate HTTP Port


## Configuration

Configuration files are stored in `rootfs/appdata/config/`. Mount these as volumes to persist configuration:

```yaml
volumes:
  - ./cgate3-server/rootfs/appdata/config:/config
  - ./cgate3-server/rootfs/appdata/logs:/logs
  - ./cgate3-server/rootfs/home:/Projects
```

## Sample Docker Compose File
```yaml
  cgate3:
   hostname: "cgate3"
   build:
     context: ./cgate3-server
   container_name: cgate3
   networks:
     - local
   ports:
       - 30023:20023
       - 30024:20024
       - 30025:20025
       - 30026:20026
       - 30123:20123
   volumes:
       - ./cgate3-server/rootfs/appdata/config:/config
       - ./cgate3-server/rootfs/appdata/logs:/logs
       - ./cgate3-server/rootfs/home:/Projects
   restart: unless-stopped
```