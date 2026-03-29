{ pkgs, lib, username, ...}:

{
    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" ];
        shell = pkgs.zsh;
    };

    nix.settings = {
        trusted-users = [ username ];
        experimental-features = [ "nix-command" "flakes" ];
        auto-optimise-store = true;
    };

    boot.loader = {
        limine = {
            enable = true;
            enableEditor = true;
            maxGenerations = 5;
            efiSupport = true;
            extraEntries = ''
                /Windows 11
                    protocol: efi
                    path: uuid(bfd3a7a4-d120-437b-899b-0549f3d725c0):/EFI/Microsoft/Boot/bootmgfw.efi
            '';

            style = {
                wallpapers = [];
                interface.branding = "Limini!!!!!";
                graphicalTerminal = {
                    palette = "1e1e2e;f38ba8;a6e3a1;f9e2af;89b4fa;f5c2e7;94e2d5;cdd6f4";
                    brightPalette = "585b70;f38ba8;a6e3a1;f9e2af;89b4fa;f5c2e7;94e2d5;cdd6f4";
                    background = "1e1e2e";
                    foreground = "cdd6f4";
                    brightBackground = "585b70";
                    brightForeground = "cdd6f4";
                };
            };
        };
        efi.canTouchEfiVariables = true;
    };

    nix.gc = {
        automatic = true;
        dates = "14day";
    };

    services.printing.enable = true;
    services = {
        pipewire = {
            enable = true;
            pulse.enable = true;
            jack.enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
        };

        openssh = {
            enable = true;
            settings.PermitRootLogin = "yes";
            settings.PasswordAuthentication = false;
            openFirewall = true;
        };

        libinput.enable = true;
        udisks2.enable = true;
        
        displayManager.ly = {
            enable = true;
            x11Support = true;
            settings = {
                allow_empty_password = true;
                animation = "colormix";
                animation_timeout_sec = 0;
                asterisk = "~";
                auth_fails = 10;
                bg = "0x00000000";
                bigclock = "en";
                blank_box = true;
                border_fg = "0x001A0116";
                box_title = null;
                clear_password = true;
                clock = null;
                colormix_col1 = "0x20000000";
                colormix_col2 = "0x00140076";
                colormix_col3 = "0x0068094F";
                error_bg = "0x00000000";
                error_fg = "0x01FF0000";
                fg = "0x001A0116";
                hide_borders = false;
                hide_key_hints = false;
                initial_info_text = ">.<";
                input_len = 34;
                lang = "en";
                load = true;
                login_cmd = null;
                logout_cmd = null;
                margin_box_h = 2;
                margin_box_v = 1;
                min_refresh_delta = 5;
                numlock = true;
            };
        };
    };

    environment.systemPackages = with pkgs; [
        neovim
        git
        wget
        fastfetch
        btop
        inotify-tools
        killall
        autojump
    ];

    fonts = {
        packages = with pkgs; [
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-color-emoji

            nerd-fonts.jetbrains-mono
        ];

        fontconfig.defaultFonts = {
            serif = [ "Noto Serif" "Noto Color Emoji" ];
            sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
            monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
            emoji = [ "Noto Color Emoji" ];
        };

        fontconfig.enable = true;
        enableDefaultPackages = false;
    };

    nixpkgs.config.allowUnfree = true;
    time.timeZone = "Asia/Kuala_Lumpur";
    i18n.defaultLocale = "en_US.UTF-8";
    networking.networkmanager.enable = true;
    programs.zsh.enable = true;
    hardware.bluetooth.enable = true;

    hardware.enableRedistributableFirmware = true;
    hardware.cpu.intel.updateMicrocode = true;


}