{ ... }:
{
  programs.git = {
    enable = true;
    userName = "langsjo";
    userEmail = "roylangsjo@gmail.com";

    aliases = {
      co = "checkout";
    };

    extraConfig = {
      rerere.enabled = true;
      init.defaultBranch = "main";
      core.editor = "nvim";
      pull.rebase = true;
    };

    includes = [
      {
        contents.user.name = "Roy Långsjö";
        contents.user.email = "roy.langsjo@aalto.fi";
        condition = "gitdir:~/Kurssit/**";
      }
    ];

  };
}
