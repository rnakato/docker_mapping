for tag in 2022.05 latest #2022.04
do
    docker build -t rnakato/mapping:$tag .
    docker push rnakato/mapping:$tag
done
