![GitHub Logo](/extras/images/Success.png)

###### <i>Recent Update on 14/04/2022.</i>
• Started the project.

## Subject:

You can find the subject of this project [here.](https://github.com/Olbrien/42Lisboa-lvl_5_inception/blob/main/extras/lvl_5_inception.pdf)

## Useful Links:

[hub.docker.com](https://hub.docker.com)

## Research:

<code>

Docker:

	Docker is a tool designed to make it easier to create, deploy, and run applications by
	using containers.


-------------------------------------------------------------------------------------------------

Container:

	Is a way to package applications with all the necessary dependencies and configurations.
	It is portable and easily shared and moved around.

	Containers can be public or private.
	You can find public containers in the Docker Hub.
	https://hub.docker.com


	Why are containers good?

		Because if you're working on a team, anyone can work on the container even if they
	don't share the same OS.
		The container is it's own operating system.


	Containers are made of images.


-------------------------------------------------------------------------------------------------

Commands:

	docker run "name"
		Runs an instance of an image in the docker host. If the image doesn't exist it downloads.

	docker pull "name"
		Downloads an image, but doesn't run it.

	docker ps
		Shows all images that are running and some basic informations about them. PS (Process Status).

	docker ps -a
		Shows all images that are running even the ones that have stopped. --all works as well.

	docker inspect "name"
		Shows in detail the container in a JSON file.

	docker stop "name"
		Stops the image that it's running. To find the name of the image you want to stop
		type "docker ps".

	docker start "name"
		Starts an image that you stopped.

	docker restart "name"
		Restarts a running image.

	docker rm "name"
		Removes an image permanently from the container.

	docker images
		Shows a list of installed images.

	docker rmi "name"
		Removes permanently an image from the host.

	docker exec "name" "command"
		Executes the commands in the image. For example if you have an ubuntu image you
		can do "sudo docker exec "running-image-name" ls"

		If you want to open bash you can do
		"sudo docker exec -it "running-image-name" /bin/bash"
		"sudo docker exec -it "running-image-name" /bin/sh"
		One of these will work.


	--name
		Changes the name of the image so it isn't a random name.
		"sudo docker run -name ola-mundo fhsinchy/hello-dock"

	-d
		This makes the container work in the background.
		You can see it working from "docker ps".
		You can also use --detatch
			Example: "sudo docker run -d kodekloud/simple-webapp"

	-p
		Publish a container's port(s) to the host.
		"sudo docker -p 80:80 -p 443:443"

	(tag) ':'
		Running with different versions.
		"sudo docker run redis" runs the latest version.
		"sudo docker run redis:4.0" runs the 4.0 version.


	docker network ls
		Shows a list of networks you have.

	docker network create "name"
		Creates a new network.


-------------------------------------------------------------------------------------------------

Docker vs Virtual Machines

	Docker is container based technology and containers are just user space of the operating system.
	A container is just a set of processes that are isolated from the rest of the system,
	running from a distinct image that provides all files necessary to support the processes.
	It is built for running applications. In Docker, the containers running share the host OS kernel.

	A Virtual Machine, on the other hand, is not based on container technology.
	They are made up of user space plus kernel space of an operating system. Under VMs,
	server hardware is virtualized. Each VM has Operating system (OS) & apps. It
	shares hardware resource from the host.

	VMs & Docker – each comes with benefits and demerits. Under a VM environment,
	each workload needs a complete OS. But with a container environment, multiple
	workloads can run with 1 OS. The bigger the OS footprint, the more environment benefits
	from containers. With this, it brings further benefits like Reduced IT management
	resources, reduced size of snapshots, quicker spinning up apps, reduced & simplified
	security updates, less code to transfer, migrate and upload workloads.

	VM’s are built for applications that are usually more static and don’t change very often.
	Whereas containers are more flexible and make it possible to easily and
	frequently update your containers.

	Size: Docker images are also much smaller.
	Speed: Docker containers are much faster on boot and performance.


-------------------------------------------------------------------------------------------------

Docker Network:

	By default you have 3 networks.
	You can type "sudo docker network ls".

	- bridge
	- none
	- host

	These are the same as:

		bridge = docker run Alpine
		none   = docker run Alpine --network=none
		host   = docker run Alpine --network=host

	To make a new network you can type.
	"sudo docker network create alpine-network"


	If you use docker-compose you don't need to do these commands. With docker-compose
	it creates networks automatically.


-------------------------------------------------------------------------------------------------

Dockerfile:

	Is a blueprint to create docker images.

	To create an image you type:
		"docker build -t "name" "directory""

	To run the new image you type:
		"docker run "name you gave""


-------------------------------------------------------------------------------------------------

Docker-Compose:

	To write a Docker-Compose you can not use tabs, only spaces, and you have to ident it
	accordingly.

	To run Docker-Compose you type:
		"docker-compose -f "name.yaml" up"

	To close the Docker-Compose you opened you type:
		"docker-compose -f "name.yaml" down"

		Closing this way it will also delete the networks. So it's better to close it like this.

	When you run the Docker-Compose it creates a network automatically. You can check it by
	by typing "docker network ls".


-------------------------------------------------------------------------------------------------

Docker Volumes:

	Volumes is used so you don't lose the database all the time you start the container.

	In the .yaml file you have to add:

	"volumes:" in two specific parts, the first part it's on the service you want to use
	use volumes, and on the services.

	To know what files to save (persist) of your database you have to google.
	For Mongo DB, google "mongodb database directory".
	The path is "/data/db"
	You can save random paths with files inside too.

	Example:

		version: '3'
		services:
			mongodb:
				image: mongo
				ports:
					- 27017:27017
				environment:
					- MONGO_INITDB_ROOT_USERNAME=admin
					- MONGO_INITDB_ROOT_PASSWORD=password
				volumes:
					- mongo-data:/data/db
					- just-a-file:/teste
			mongoexpress:
				image: mongo-express
				ports:
					- 8080:8081
				environment:
					- ME_CONFIG_MONGODB_ADMINUSERNAME=admin
					- ME_CONFIG_MONGODB_ADMINPASSWORD=password
					- ME_CONFIG_MONGODB_SERVER=mongodb
		volumes:
			mongo-data:
				driver: local
			just-a-file:
				driver: local


	To see a list of all volumes type:
		"sudo docker volume ls"

	To remove all volumes type:
		"sudo docker volume prune"



-------------------------------------------------------------------------------------------------

SSL vs TLS:

	TLS short for Transport Layer Security.
	SSL short for Secure Socket Layers.

	When you install an SSL/TLS certificate on your web server (often just called an
	“SSL certificate), it includes a public key and a private key that authenticate your
	server and let your server encrypt and decrypt data.

	When a visitor goes to your site, their web browser will look for your site’s
	SSL/TLS certificate. Then, the browser will perform a “handshake” to check the
	validity of your certificate and authenticate your server. If the SSL certificate is
	not valid, your users may be faced with the “your connection is not private” error,
	which could cause them to leave your website.

	Once a visitor’s browser determines that your certificate is valid and authenticates your
	server, it essentially creates an encrypted link between it and your server to securely
	transport data.

	This is also where HTTPS comes in (HTTPS stands for “HTTP over SSL/TLS”).

	HTTP, and the more recent HTTP/2, are application protocols that play an essential role
	in transferring information over the Internet.

	With plain HTTP, that information is vulnerable to attacks. But when you use HTTP over
	SSL or TLS (HTTPS), you encrypt and authenticate that data during transport,
	which makes it secure.

	This is why you can safely process credit card details over HTTPS but not over HTTP,
	and also why Google Chrome is pushing so hard for HTTPS adoption

	Both cryptographic protocols that encrypt data and authenticate a connection when moving
	data on the Internet.

	For example, if you’re processing credit card payments on your website, TLS and SSL
	can help you securely process that data so that malicious actors can’t get their hands on it.


	How encryption works:

	Encryption is necessary in order to communicate securely over the internet: if your
	data isn't encrypted, anyone can examine your packets and read confidential information.
	The safest method of encryption is called asymmetrical cryptography; this
	requires two cryptographic keys — pieces of information, usually very large numbers — to
	work properly, one public and one private. The mathematics here are complex, but in
	essence, you can use the public key to encrypt the data, but need the private key to
	decrypt it. The two keys are related to each other by some complex mathematical formula
	that is difficult to reverse-engineer by brute force. Think of the public key as
	information about the location of a locked mailbox with a slot on the front, and
	the private key as the key that unlocks the mailbox. Anyone who knows where the mailbox
	is can put a message in it; but for anyone else to read it, they need the private key.


-------------------------------------------------------------------------------------------------

Nginx:

	Acts both as a Web Server and a Proxy.

	NGINX is open source software for web serving, reverse proxying, caching, load balancing,
	media streaming, and more.


-------------------------------------------------------------------------------------------------

Alpine Linux:

	Small. Simple. Secure. Alpine Linux is a security-oriented, lightweight Linux distribution
	based on musl libc and busybox.

	The latest version on June 7 accordingly to https://hub.docker.com/_/alpine
	is "3.13.5, 3.13, 3, latest".
	The penultimate version is "3.12.7, 3.12"

	To see the version of your Alpine Linux:
		cat /etc/alpine-release



-------------------------------------------------------------------------------------------------



- Has to be done in Docker-Compose
- Each Docker image must have the same name as its corresponding service.
- Each service has to run in a dedicated container.
- For performance matters, the containers must be built either from the penultimate stable
	version of Alpine Linux, or from Debian Buster. The choice is yours.
- You also have to write your own Dockerfiles, one per service. The Dockerfiles must
	be called in your docker-compose.yaml by your Makefile.
- It means you have to build yourself the Docker images of your project. It is then for-
	bidden to pull ready-made Docker images, as well as using services such as DockerHub
	(Alpine/Debian being excluded from this rule).


</code>
