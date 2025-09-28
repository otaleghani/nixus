{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # hardware.pulseaudio.support32Bit = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
    intel-compute-runtime # Provides OpenCL for modern Intel GPUs (Arc)
    ocl-icd # OpenCL Installable Client Driver loader
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [ 8080 ];
  networking.firewall.allowedUDPPorts = [ 8080 ];
  boot.kernelModules = [ "nf_conntrack_ftp" ]; # Tracks and allows ftp connections
  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
    "2606:4700:4700::1111"
    "2606:4700:4700::1001"
  ];
  networking.extraHosts = ''
    10.129.201.127 inlanefreight.htb
    10.129.201.127 int-ftp.inlanefreight.htb
    94.237.50.221 admin.academy.htb
    94.237.61.242 test.academy.htb
    94.237.61.242 archive.academy.htb
    94.237.61.242 faculty.academy.htb
  '';

  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # virtualisation.virtualbox.guest.enable = true;
  # virtualisation.virtualbox.guest.draganddrop = true;
  # users.extraGroups.vboxusers.members = [ "oliviero" ];

  time.timeZone = "Europe/Rome";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.oliviero = {
    isNormalUser = true;
    description = "Oliviero Taleghani";
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxusers"
      "audio"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };

  services.getty.autologinUser = "oliviero";
  # services.openssh.enable = true;

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term
    geist-font
  ];

  fonts.fontconfig = {
    defaultFonts = {
      serif = [ "Liberation Serif" ];
      sansSerif = [ "Geist" ];
      monospace = [ "Iosevka Term Nerd Font" ];
    };
  };

  programs.hyprland.enable = true;
  programs.zsh.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  };

  environment.systemPackages = with pkgs; [
    # Basics
    neovim
    zip
    cmake
    gnumake
    unzip
    tmux
    gcc
    curl
    vim
    wget
    git
    lazygit
    nil
    uwsm

    # Languages - LUA
    lua-language-server
    stylua

    # Utils
    fzf
    ripgrep
    fd
    jq
    xmlstarlet
    btop
    bat
    eza
    rclone
    starship
    qemu
    virt-viewer
    virt-manager
    libvirt
    bluetui # TUI for managing bluetooth on Linux
    impala # TUI for managing wifi

    # Softwares
    ghostty
    kitty
    wezterm
    chromium
    firefox
    mpv
    imv
    krita
    inkscape
    obsidian
    qbittorrent
    kdePackages.dolphin
    feh
    grim # Screenshots
    slurp # Screen selection for screenshots
    nerdfetch
    yazi

    # Hyprland
    mako
    libnotify
    rofi
    wl-clipboard
    cliphist
    waybar
    hyprpaper
    hyprpicker
    rose-pine-hyprcursor
  ];

  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  system.stateVersion = "25.05";

  system.activationScripts.setup = {
    text = ''
      # TODO: Add setup script
      echo "Hello from update script!"
      cp -f ~/.config/zsh/.zshenv ~/
    '';
  };
}
