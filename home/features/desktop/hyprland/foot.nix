{ config, pkgs, ... }:

{
	programs.foot = {
		enable = true;
		server.enable = true;
		settings = {
		  main = {
	        font = "FiraCode Nerd Font:size=16";
			dpi-aware = false;
		  };
		  colors = {
			foreground = "d9e0ee";
			background = "1e1e2e";

			regular0 = "232a2d";
			regular1 = "e57474";
			regular2 = "8ccf7e";
			regular3 = "e5c76b";
			regular4 = "67b0e8";
			regular5 = "c47fd5";
			regular6 = "6cbfbf";
			regular7 = "b3b9b8";

			bright0 = "2d3437";
			bright1 = "ef7e7e";
			bright2 = "96d988";
			bright3 = "f4d67a";
			bright4 = "71baf2";
			bright5 = "ce89df";
			bright6 = "67cbe7";
			bright7 = "bdc3c2";
		  };
		};
	};
}
