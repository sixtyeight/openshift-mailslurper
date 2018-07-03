# We are basing our builder image on openshift base-centos7 image
FROM openshift/base-centos7

# Inform users who's the maintainer of this builder image
# nobody :)

COPY ./mailslurper /app/mailslurper

# Drop the root user and make the content of /app owned by user 1001
RUN chown -R 1001:1001 /app

# Set the default user for the image, the user itself was created in the base image
USER 1001

CMD ["/app/mailslurper"]
