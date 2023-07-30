#!/in/bash
export IFS=$'\n';
export SELECTION=$(for i in $(tmux list-sessions -F "#{session_name}: #{pane_current_command}");
do
    echo $i;
    export SESSION=$(echo $i | sed 's/:.*//g');
    for j in $(tmux list-window -F "#{window_index} #{pane_current_command}" -t $SESSION);
    do
        echo $j | xargs echo - $SESSION ;
    done;
    for j in $(tmux list-pane -F "#{window_index}.#{pane_index} #{pane_current_command}" -s -t $SESSION);
    do
        echo $j | xargs echo -- $SESSION;
    done;
done | fzf)

if [[ "$SELECTION" == "-- "* ]];
then
    export SESSION=$(echo $SELECTION | awk '{print $2}');
    export PANE=$(echo $SELECTION |  awk '{print $3}' | tr -d ':');
    export WINDOW=$(echo $SELECTION| awk '{print $3}' | tr -d ':');
    tmux switch-client -t $SESSION;
    tmux select-window -t $WINDOW;
    tmux select-pane -t $PANE;
elif [[ "$SELECTION" == "- "* ]];
then
    export SESSION=$(echo $SELECTION | awk '{print $2}');
    export WINDOW=$(echo $SELECTION | awk '{print $3}');
    tmux switch-client -t $SESSION;
    tmux select-window -t $WINDOW;
elif ! [[ -z "$SELECTION" ]];
then
    export SESSION=$(echo $SELECTION | sed 's/: .*//g');
    tmux switch-client -t $SESSION;
fi

