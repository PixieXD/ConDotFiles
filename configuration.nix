{ config, lib, pkgs, ... }:

{
	imports =
		[
			./hardware-configuration.nix
		];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	nixpkgs.config.allowUnfree = true;
	
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
				wallpapers = [ ];
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

	networking = {
		hostName = "larry-victus";
		networkmanager.enable = true;
	};

	hardware = {
		graphics.enable = true;
		nvidia = {
			open = true;
			modesetting.enable = true;
			package = config.boot.kernelPackages.nvidiaPackages.stable;
			nvidiaSettings = true;
			prime = {
				intelBusId = "PCI:0:2:0";
				nvidiaBusId = "PCI:1:0:0";
			};
		};
	};

	services.xserver.videoDrivers = [ "nvidia" ];
	time.timeZone = "Asia/Kuala_Lumpur";
	i18n.defaultLocale = "en_US.UTF-8";

	services = {
		pipewire = {
			enable = true;
			pulse.enable = true;
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

	programs = {
		hyprland = {
			enable = true;
			xwayland.enable = true;
		};

		waybar.enable = true;
		zsh.enable = true;

	};

	users.users.larry = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" ];
		packages = with pkgs; [
			tree
		];
		shell = pkgs.zsh;
	};

	environment.systemPackages = with pkgs; [
		neovim
		git
		wget
		fastfetch
		btop
		inotify-tools
		killall
	];

	fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
	];
	
	system.stateVersion = "25.11"; # Did you read the comment? yes :)
}

