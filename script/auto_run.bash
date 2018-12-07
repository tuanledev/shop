if lsof -Pi :9090 -sTCP:LISTEN -t >/dev/null ; 
then
    echo "running"
else
    nohup /home/project/src/shop/shop >/dev/null 2>&1 &
fi