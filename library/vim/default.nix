{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wmctrl
    (
      let
        vimrc = builtins.readFile ../../.dotfiles/.vimrc;
        rc = ''
          ${vimrc}
        '';
        plugins = pkgs.callPackage ./plugins.nix {};
      in
        with import <nixpkgs> {};
        vim_configurable.customize {
          name = "vim";
          vimrcConfig.customRC = rc;
          vimrcConfig.vam.knownPlugins = pkgs.vimPlugins // plugins;
          vimrcConfig.vam.pluginDictionaries = [
            { names = [
                "vimproc"
                "syntastic"
                "tabular"
                "tlib"
                "nerdtree"
                "ctrlp"
                "airline"
                "airline-themes"
                "fugitive"
                "multiple-cursors"
                "gitgutter"
                "signify"
                "toml"
                "fsharp-syntax"
                "kuvim-themes"
                "papercolor-theme"
                "spacemacs-theme"
                "quantum-theme"
                "colorschemes"
                "colorstepper"
                "supertab"
                "nix"
            ]; }
          ];
        }
    )
  ];
}
