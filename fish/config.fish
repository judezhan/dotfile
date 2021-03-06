. ~/.config/fish/aliases.fish

set fish_greeting

set fish_git_dirty_color red
set fish_git_not_dirty_color yellow

set -xg PATH $PATH /Users/judez/Dev/apache-maven-3.3.9/bin/
set -xg PATH $PATH /Users/judez/Dev/apache-cassandra-3.10/bin/
set -xg JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home
set -xg TERM xterm-256color

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
  end
end

function fish_prompt
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)
  if test -n "$git_dir"
    printf '%s%s%s (%s) > ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch)
  else
    printf '%s%s%s > ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  end
end
