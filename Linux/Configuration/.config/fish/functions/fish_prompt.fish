function fish_prompt --description "Write out the prompt"
echo -n -s "[$USER" @ (prompt_hostname) ' ' (pwd | sed 's#.*/##') ] (set_color normal) \$ ' '
end
