# Executable Environment for OSF Project [tg3fq](https://osf.io/tg3fq/)

This repository was automatically generated as part of a project to test the reproducibility of open science projects hosted on the Open Science Framework (OSF).

**Project Title:** A personality trait-based network of boredom, spontaneous and deliberate mind-wandering

**Project Description:**
> This article reports the translation into German and validation of two self-report measures of mind-wandering and boredom (the Spontaneous and Deliberate Mind-Wandering Scales; SDMWS; Carriere, Seli, &amp; Smilek, 2013, and the Short Boredom Proneness Scale; SBPS; Struk, Carriere, Cheyne, &amp; Danckert, 2017). Confirmatory factor analyses (CFAs) provided support for the original conceptualization of the constructs. To evaluate measurement invariance across samples, data were collected in a German-speaking sample (n = 418) and an English-speaking sample (n = 364). The results indicated weak measurement invariance. To explore the interplay between mind-wandering and boredom, we performed an exploratory graph analysis (EGA) in the entire sample (N = 782), which revealed the structure of relationships between boredom and the two facets of mind-wandering. The results are discussed in the context of theoretical accounts of boredom and mind-wandering. 

**Original OSF Page:** [https://osf.io/tg3fq/](https://osf.io/tg3fq/)

---

**Important Note:** The contents of the `tg3fq_src` folder were cloned from the OSF project on **12-03-2025**. Any changes made to the original OSF project after this date will not be reflected in this repository.

The `DESCRIPTION` file was automatically added to make this project Binder-ready. For more information on how R-based OSF projects are containerized, please refer to the `osf-to-binder` GitHub repository: [https://github.com/Code-Inspect/osf-to-binder](https://github.com/Code-Inspect/osf-to-binder)

## flowR Integration

This version of the repository has the **[flowR Addin](https://github.com/flowr-analysis/rstudio-addin-flowr)** preinstalled. flowR allows visual design and execution of data analysis workflows within RStudio, supporting better reproducibility and modular analysis pipelines.

To use flowR, open the project in RStudio and go to `Addins` > `flowR`.

## How to Launch:

**Launch in your Browser:**

🚀 **MyBinder:** [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/code-inspect-binder/osf_tg3fq-f/HEAD?urlpath=rstudio)

   * This will launch the project in an interactive RStudio environment in your web browser.
   * Please note that Binder may take a few minutes to build the environment.

🚀 **NFDI JupyterHub:** [![NFDI](https://nfdi-jupyter.de/images/nfdi_badge.svg)](https://hub.nfdi-jupyter.de/r2d/gh/code-inspect-binder/osf_tg3fq-f/HEAD?urlpath=rstudio)

   * This will launch the project in an interactive RStudio environment on the NFDI JupyterHub platform.

**Access Downloaded Data:**
The downloaded data from the OSF project is located in the `tg3fq_src` folder.

## Run via Docker for Long-Term Reproducibility

In addition to launching this project using Binder or NFDI JupyterHub, you can reproduce the environment locally using Docker. This is especially useful for long-term access, offline use, or high-performance computing environments.

### Pull the Docker Image

```bash
docker pull meet261/repo2docker-tg3fq-f:latest
```

### Launch RStudio Server

Run the container (with a name, e.g. `rstudio-dev`):
```bash
docker run -it --name rstudio-dev --platform linux/amd64 -p 8888:8787 --user root meet261/repo2docker-tg3fq-f bash
```

Inside the container, start RStudio Server with no authentication:
```bash
/usr/lib/rstudio-server/bin/rserver --www-port 8787 --auth-none=1
```

Then, open your browser and go to: [http://localhost:8888](http://localhost:8888)

> **Note:** If you're running the container on a remote server (e.g., via SSH), replace `localhost` with your server's IP address.
> For example: `http://<your-server-ip>:8888`

## Looking for the Base Version?

For the original Binder-ready repository **without flowR**, visit:
[osf_tg3fq](https://github.com/code-inspect-binder/osf_tg3fq)

