# Docker image for huva analysis

Docker image for R Studion (Bioconductor 3.12) configured for huva analysis

## usage
docker run -dp 7777:8787 -e USER=mariorossi -e PASSWORD=mariorossi --name huva_analysis -v /mnt/e/docker_test:/data/ huva_docker:014