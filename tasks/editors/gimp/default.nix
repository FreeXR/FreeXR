{ ... }:

{
	perSystem = { inputs', lib, pkgs, ... }: {
		mission-control.scripts = {
			gimp = {
				description = "Open repository-standardized GIMP version with configuration";
				category = "Integrated Development Environments";
				exec = "${inputs'.nixpkgs.legacyPackages.gimp}/bin/gimp \"$@\"";
			};
		};
	};
}
