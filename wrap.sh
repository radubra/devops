#!/bin/bash
docker-compose up -d
php_images=`docker ps | grep php_ | awk '{print $1}'`
for i in $php_images; do docker exec -d $i /bin/bash -c "service filebeat restart"; done
jenkins_image=`docker ps | grep jenkins | awk '{print $1}'`
for i in $jenkins_image; do docker exec -d $i /bin/bash -c  "/usr/bin/java -jar /var/jenkins_home/war/WaEB-INF/jenkins-cli.jar -s http://localhost:8080 create-job "delete_elasticsearch_indices_1" < /tmp/job.xml"; done
