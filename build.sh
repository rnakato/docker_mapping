for tag in 2022.04 latest
do
    docker build -t rnakato/mapping:$tag .
    docker push rnakato/bowtie-cs-yeast:$tag
done
