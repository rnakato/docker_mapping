for tag in 2024.03.2 latest
do
    docker build -t rnakato/mapping:$tag .
    docker push rnakato/mapping:$tag
done
