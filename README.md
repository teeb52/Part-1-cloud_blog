# Techpet Global DevOps Interns Challenge Part 1 
## Cloud Blog Web Application

This is a Flask application that lists the latest articles within the cloud-native ecosystem.

## Instructions
1. Fork this repo
2. Create an optimized dockerfile to dockerize the application.
3. Use any CICD tool of your choice, create a pipeline that will dockerize and deploy to your docker hub.
4. Create your own Readme.md file to document the process and your choices.

To run this application there are 2 steps required:

1. Initialize the database by using the `python init_db.py` command. This will create or overwrite the `database.db` file that is used by the web application.
2.  Run the Cloud Blog application by using the `python app.py` command. The application is running on port `3111` and you can access it by querying the `http://127.0.0.1:3111/` endpoint.

##My Processes and Choices

The first step i took was to fork this repo, then i downloaded it via the ZIP file and extracted it. Next step in order to create a dockerfile was to open the extracted file with VS code which i did and i installed the dependencies in the requirement.txt file using "pip install -r requitrements.txt" and created the databse to be used by the application. then upon trying to run the application using "python app.py", i encountered some errors. 

The first error i encountered was "ImportError: cannot import name 'escape' from 'jinja2'" and i researched for some feasible solution. Upon my research, resolved to upgrading the verison of flask in the requirements.txt file from 1.1.1 t0 2.1.0, still the same error popped up. 
Another resolution i stumbled upon, suggested i downgrade jinja as the escape features has been removed which i tried by inputting "jinja2<3.1.0" as another entry in the requirement.txt file but i still did not get the desired result. I also tried importing escape directly using "from markupsafe import escape" in the "_init_.py" but this time i got a different error "ImportError: cannot import name 'json' from 'itsdangerous'". Then i explicitly added the dependecy "itsdangerous==2.0.1" to the requirements.txt file and it worked like magic.

Next step is to package it into a container. in order to do so, i created a dockerfile by creating a file under the opened folder in VS code name "Dockerfile" then i selected the baseimage, python 3.10. "FROM python:3.9" specifically tells docker to doenload python from dockerhub, using it as the first layer. Next thing i did was to copy the project directory into container using "COPY . /myproject". Then i provision for the need to install python packages via "RUN pip install -r /myproject/requirements.txt". It is neccessary for all commands to be a line like a linux terminal as extra unneccesary lines adds more image layers hence more disk space is used. I installed screen and removed apt cache files using the "RUN" directive. Next, i instructed docker how to run the application once th container starts using "CMD" directive. I created a new container image from the docker file using "docker build ." where the '.' dot specifies the current directory as the build context in which docker will search for the Dockerfile and copy project files and directories from.
Another round of errors were encountered as i ran the "docker build ." command. The most prominent one was "failed to solve with frontend dockerfile.v0: failed to create LLB definition: failed to do request: Head "https://registry-1.docker.io/v2/library/python/manifests/3.10"." , of which after research, i opened the docker engine on the application and change the values for buildkit and builder to false. I reran the command and it all went smoothly. To confirm the build i ran "docker image ls" and the verified the image ID was displayed on the terminal. Then i told docker to forward the local port 3111 into the container using "docker run -p 3111:3111 99c576c785fe" and tagged the image with 'cloud-blog'.