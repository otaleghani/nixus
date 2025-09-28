# Truenas home server
mkdir -p ~/truenas/media
mkdir -p ~/truenas/vault
rclone mount truenas:Media ~/truenas/media --vfs-cache-mode writes >~/.local/share/rclone_truenas_media.log 2>&1 &
rclone mount truenas:Vault ~/truenas/vault --vfs-cache-mode writes >~/.local/share/rclone_truenas_vault.log 2>&1 &

# S3 Buckets
mkdir -p ~/hetzner/aficleaning
mkdir -p ~/hetzner/benienergia
mkdir -p ~/hetzner/benienergia-media
mkdir -p ~/hetzner/memecraft
mkdir -p ~/hetzner/planbnb-backup
mkdir -p ~/hetzner/talesign-deus
mkdir -p ~/hetzner/talesign
rclone mount hetzner:aficleaning ~/hetzner/aficleaning --vfs-cache-mode writes >~/.local/share/rclone_hetzner_aficleaning.log 2>&1 &
rclone mount hetzner:benienergia ~/hetzner/benienergia --vfs-cache-mode writes >~/.local/share/rclone_hetzner_benienergia.log 2>&1 &
rclone mount hetzner:benienergia-media ~/hetzner/benienergia-media --vfs-cache-mode writes >~/.local/share/rclone_hetzner_benienergia-media.log 2>&1 &
rclone mount hetzner:memecraft ~/hetzner/memecraft --vfs-cache-mode writes >~/.local/share/rclone_hetzner_memecraft.log 2>&1 &
rclone mount hetzner:planbnb-backup ~/hetzner/planbnb-backup --vfs-cache-mode writes >~/.local/share/rclone_hetzner_planbnb-backup.log 2>&1 &
rclone mount hetzner:talesign-deus ~/hetzner/talesign-deus --vfs-cache-mode writes >~/.local/share/rclone_hetzner_talesign-deus.log 2>&1 &
rclone mount hetzner:talesign ~/hetzner/talesign --vfs-cache-mode writes >~/.local/share/rclone_hetzner_talesign.log 2>&1 &
