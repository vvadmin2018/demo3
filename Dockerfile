FROM busybox:latest
RUN mkdir /testDockerWars
COPY ["target/*.jar", "./testDockerWars/"]
EXPOSE 3000
CMD ["echo", "Test from dock image"]
