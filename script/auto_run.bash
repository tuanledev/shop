if lsof -Pi :9090 -sTCP:LISTEN -t >/dev/null ; 
then
    echo "running"
else
    nohup bee run /home/project/src/shop &
fi