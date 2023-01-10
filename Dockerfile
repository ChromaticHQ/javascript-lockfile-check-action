# Container image that runs this action.
FROM alpine:3.17.1

# Copy code file from action repo to container filesystem.
COPY entrypoint.sh /entrypoint.sh

# File to execute when the container starts up.
ENTRYPOINT ["/entrypoint.sh"]
