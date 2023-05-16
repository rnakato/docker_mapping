for tag in 2023.05 latest
do
    docker build -t rnakato/mapping:$tag .
    docker push rnakato/mapping:$tag
done
