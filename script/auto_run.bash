if lsof -Pi :9090 -sTCP:LISTEN -t >/dev/null ; 
then
    echo "running"
else
    cd /home/project/src/shop/; nohup ./shop >/dev/null 2>&1 &
fi