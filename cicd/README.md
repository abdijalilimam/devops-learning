I Have Built my first CI/CD workflow 


here is how that was done:

- step 1: made a simple python flask app and ran it locally 

- step 2: Containerized it using docker and built image successfully 

- step 3: Made a .github/workflow at the root to initilize pipelines 

- step 4: made a ci.yml that was triggered on push that if the docker image was build successfully  

- step 5: made a cd.yml that build and pushed the image to the dockerhub



What I have Learned 

- The yaml sytanx  
- Diffrence between CI and CD 
- Having .github/workflows at the root and not anywhere else 


Issues I ran into
- yaml indetation errors 
- used vars.DOCKERHUB_USERNAME instead of secrets.DOCKERHUB_USERNAME

