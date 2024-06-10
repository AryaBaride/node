This is simple nodejs application displaying a hello world message on the screen.

The following are the steps involved in the application : 
1) Initially create a file named app.js which would consist of a simple nodejs code printing a hello world message.
   Configure the HTTP server in this application, and the ports for the incoming requests and print the message in the form of response.
2) Then create a package.json file which will consist of all the metadata and the dependencies for configuring the appliaction.
3) The package-lock.json file ensures that the exact version of the packages and their dependencies are used.
4) Now containerize this application with the help of Docker. Create a Dockerfile that will containerize and build and image of the application.
5) Write the terraform scripts which will help the terraform to configure and authenticate the AWS credentials. This configuration will ensure that terraform can interact with both AWS and Docker environments.
6) In the Github Actions the deploy.yaml file will automate the process of deploying a Dockerized application to Amazon ECS.

Workflow :
1) Checking out the code from the repository. Building the code.
2) Configures AWS credentials.
3) Logs into Amazon ECR.
4) Builds and pushes a docker image to the ECR repository.
5) Updates the ECS task defonition with the correct AWS account.
6) Deploys the updated task definition to the specified ECS service and cluster.
   
Refernces :
https://kerneltalks.com/cloud-services/configuring-visual-studio-code-for-terraform-to-work-with-aws/
https://docs.aws.amazon.com/AmazonECS/latest/developerguide/get-set-up-for-amazon-ecs.html
