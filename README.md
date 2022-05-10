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
