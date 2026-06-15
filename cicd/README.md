# CI/CD Pipeline Project

## What I Built
I built my first CI/CD workflow. Here is how that was done:

1. Made a simple Python Flask app and ran it locally
2. Containerized it using Docker and built the image successfully
3. Made a `.github/workflows` at the root to initialize pipelines
4. Made a `ci.yml` that was triggered on push to check if the Docker image built successfully
5. Made a `cd.yml` that builds and pushes the image to Docker Hub

## What I Learned
- YAML syntax
- Difference between CI and CD — CI is like making a product, CD is like UPS delivering it to the customer
- `.github/workflows` must live at the root, not anywhere else

## Issues I Ran Into
- YAML indentation errors causing red squiggles in VS Code
- Used `vars.DOCKERHUB_USERNAME` instead of `secrets.DOCKERHUB_USERNAME`

## Pipeline Files
- CI: `.github/workflows/ci.yml`
- CD: `.github/workflows/cd.yml`

## Screenshots
See `screenshots/` folder.