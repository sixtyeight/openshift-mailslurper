# We are basing our builder image on openshift base-centos7 image
FROM openshift/base-centos7

# Inform users who's the maintainer of this builder image
# nobody :)

COPY ./mailslurper /app/mailslurper
COPY ./runme.sh /app/runme.sh

# Drop the root user and make the content of /app owned by user 1001
RUN chown -R 1001:1001 /app
RUN chmod ugo+x /app/mailslurper
RUN chmod ugo+x /app/runme.sh

# Set the default user for the image, the user itself was created in the base image
USER 1001

EXPOSE 2500 8080 8085
WORKDIR /app

CMD ["/app/runme.sh"]
