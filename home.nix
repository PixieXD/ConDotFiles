{ config, pkgs, ... }:

{

	programs = {
		rofi.enable = true;
		waybar.enable = true;
		alacritty.enable = true;
		vesktop.enable = true;
		wlogout.enable = true;
		hyprlock.enable = true;
		zsh = {
			enable = true;
			syntaxHighlighting.enable = true;
			autosuggestion.enable = true;
			enableCompletion = true;
			oh-my-zsh = {
				enable = true;
				theme = "robbyrussell";
				plugins = [
					"git"
					"urltools"
					"autojump"
					"bgnotify"
				];
			};
		};

	};

	services = {
  		udiskie.enable = true;
		hyprpolkitagent.enable = true;
		swww.enable = true;
		copyq.enable = true;
	};

	gtk = {
		enable = true;
	};

	home.packages = with pkgs; [
		vscodium
		nemo
		autojump
		bluej
		telegram-desktop
		waypaper
		egl-wayland
		catppuccin-gtk
		hyprcursor
		hyprland-qt-support
		kdePackages.qt6ct
		nwg-look
		swaynotificationcenter
		flameshot
		grim
		swayosd
		floorp-bin
  	];

	home = {
		username = "larry";
		homeDirectory = "/home/larry";
		stateVersion = "25.11";
		file.".config/waybar".source = /home/larry/Important/ConDotFiles/Config/waybar;
		file.".config/hypr".source = /home/larry/Important/ConDotFiles/Config/hyprland;
		file.".config/fastfetch".source = /home/larry/Important/ConDotFiles/Config/Fastfetch;
		file.".config/alacritty".source = /home/larry/Important/ConDotFiles/Config/alacritty;
  	};
}
