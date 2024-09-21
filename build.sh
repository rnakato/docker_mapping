for tag in 2024.08 latest
do
    docker build -t rnakato/mapping:$tag .
    docker push rnakato/mapping:$tag
done
