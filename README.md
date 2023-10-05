
Utilizing Redis Cache for MongoDB on Node or Express :

This simple repo have mongoose / redis / express combined in a way that
whenever a record is added to MongoDB through mongoose package, it is also 
added to redis cache.

When retrieving the same record, The code first checks if the same records
is present in the redis if so it fetches it from Redis otherwise it fetches
it from the MongoDB.

This repo assumes that you already have Node, Redis and MongoDB setup on your
computer.

For windows, You must have WSL installed on your system, Redis and Docker dont run on Windows.


The available routes are:
 /add-student
 /edit-student/$(Student_id)

 To create docker image I used:

 docker build -t ankitjagtap/northladder_assignment:nodejs6 .

 Create docker network so that these three containers can communicate:

 docker network create mynetwork

 Create containers of mongodb and redis inside this network:

 docker run -d --name mongodb --network mynetwork ankitjagtap/northladder_assignment:mongodb

 docker run -d --name redis --network mynetwork ankitjagtap/northladder_assignment:redis

 Now create nodejs container with the help of :

 docker run -d --name nodejs -p 3000:3000 --network mynetwork ankitjagtap/northladder_assignment:nodejs6

Now you can check your running app in :

http://localhost:3000

With the help of docker-compose:

docker-compose up

docker-compose down

With the help of minikube :

kubectl apply -f deployment.yaml

kubectl apply -f service-defination.yaml




