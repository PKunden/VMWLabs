for i in {1..100}; do
    logger -i -p 1 $i MyEvent;
    echo $i
done