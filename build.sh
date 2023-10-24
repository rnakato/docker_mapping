for tag in 2023.10 latest
do
    docker build -t rnakato/mapping:$tag .
    docker push rnakato/mapping:$tag
done
