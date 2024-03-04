#/!bin/bash
exit_status() {
        if [ $? -eq 0 ]; then
                echo
                echo "--------------"
                echo "The system has been updated"
                echo "--------------"
        else
                echo
                echo "--------------"
                echo "The system has not been updated"
                echo "--------------"
                echo
                read -p "Do you want to exit the script? (yes/no)" answer
                if [ "$answer" -eq "yes" ]; then
                        exit 1
                fi
        fi
}
exit_status_clean() {
        if [ $? -eq 0 ]; then
                echo
                echo "--------------"
                echo "The system has been cleaned up"
                echo "--------------"
        else
                echo
                echo "--------------"
                echo "The system has been cleaned up"
                echo "--------------"
                read -p  "Do you want to exit the script? (yes/no)" answer
                if [ "$answer" -eq "yes" ]; then
                        exit 1
                fi
        fi
}
start() {
        echo
        echo "--------------"
        echo "***>>> Upgrading The Operating System <<<***"
        echo "--------------"
        echo
}
update() {
        sudo apt update;
        sudo apt upgrade -y;
        exit_status
}
cleanup() {
        sudo apt autoremove;
        exit_status_clean
}
exitUpdate() {

            echo
            echo "-------------------------------------------------------"
            echo ">>>>   Operating System Update Has Been Completed  <<<<"
            echo "-------------------------------------------------------"
            echo
        exit
}

start
update
cleanup
exitUpdate
