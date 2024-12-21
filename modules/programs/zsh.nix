{ pkgs, config, ...}: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    

    history = {
      size = 20000;
      save = 20000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
      ignoreSpace = true;
    };
    historySubstringSearch.enable = true;

    shellAliases = {
      grep = "grep --color=auto";
      ls = "ls --color=auto";
      la = "ls -A --color=auto";
      ":q" = "exit";
      ":qa" = "tmux kill-session";
      c = "clear";
      n = "nvim";
    };

    initExtra = ''
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      eval "$(zoxide init --cmd cd zsh)"
      bindkey -e
    '';

    completionInit = ''
      autoload -Uz compinit

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
    '';
  };
}
