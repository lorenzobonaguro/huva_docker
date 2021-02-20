# Docker container for an Rstudios session for huva analysis
FROM bioconductor/bioconductor_docker:RELEASE_3_12

# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    libv8-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install R packages
RUN Rscript -e 'BiocManager::install(update = T, ask = F)' && \
	Rscript -e 'BiocManager::install(c("ggplot2", "Rmisc", "ggpubr", "reshape2", "ggsci", "plotly", "knitr", "pheatmap", "useful", "rmarkdown"), version = "3.12")' && \
	Rscript -e 'BiocManager::install(c("fgsea", "limma", "GSVA"), version = "3.12")'

# Install HUVA
COPY huva_0.1.5.tar.gz /tmp/huva_0.1.5.tar.gz
COPY huva.db_0.1.5.tar.gz /tmp/huva.db_0.1.5.tar.gz
RUN Rscript -e 'install.packages("/tmp/huva.db_0.1.5.tar.gz", repos = NULL, type = "source")' && \
	Rscript -e 'install.packages("/tmp/huva_0.1.5.tar.gz", repos = NULL, type = "source")'