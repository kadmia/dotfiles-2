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
                "airline"
                "airline-themes"
                "colorschemes"
                "colorstepper"
                "ctrlp"
                "elm"
                "fsharp-syntax"
                "fugitive"
                "gitgutter"
                "go"
                "hasksyn"
                "kuvim-themes"
                "multiple-cursors"
                "nerdcommenter"
                "nerdtree"
                "nix"
                "papercolor-theme"
                "quantum-theme"
                "signify"
                "spacemacs-theme"
                "supertab"
                "surround"
                "syntastic"
                "tabular"
                "taskwarrior"
                "tlib"
                "toml"
                "vimproc"
            ]; }
          ];
        }
    )
  ];
}
