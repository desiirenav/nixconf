{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = ''
      set-option -g prefix C-b
      bind-key C-b send-prefix
      setw -g mouse on

      set-option -g default-shell /etc/profiles/per-user/study/bin/nushell

      set -g base-index 1

      bind-key | split-window -h
      bind-key - split-window -v

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      set -g repeat-time 1000

      # Create a new tmux session with a name
      bind-key S command-prompt -p ssh: "new-window -n %1 'ssh %1'"

      # reload the config with r
      bind-key r source-file ~/.tmux.conf

      run '~/.tmux/plugins/tpm/tpm'
      ...

    '';
  };
}
