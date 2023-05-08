# ffb6d-container

This repository provides a docker container for running 6D pose estimation using FFB6D. The container includes the LineMOD dataset, and if you want to use pretrained checkpoints, you will need to manually download and add them to the appropriate directory.

## Quickstart

To get started with the container, follow these steps:

1. Clone the repository to your local machine.
2. Build the container using the provided Dockerfile: `docker build -t ffb6d-container .`
3. Run the container in interactive mode: `docker run -it ffb6d-container bash`

## Usage

Once you have the container up and running, you can use it to run 6D pose estimation using FFB6D. Here are the basic steps:

1. Navigate to the `src/FFB6D/ffb6d` directory.
2. Run the `demo_lm.sh` script to perform 6D pose estimation on your data.
3. If you want to use pretrained checkpoints for the LineMod Dataset, download them and add them to the `src/FFB6D/ffb6d/trainlog/linemod/checkpoints/XXX` directory. Where XXX is the name of the object.

## Additional Information

For more information on FFB6D and 6D pose estimation, please refer to the original research paper: https://arxiv.org/abs/2103.02242v1

If you have any issues with the container or would like to contribute to the project, please submit an issue or pull request on the GitHub repository.
