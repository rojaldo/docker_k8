FROM gcc:14.3.0 as compiler

# copy the C source code
COPY ./content/sample.c /app/sample.c
# Set the working directory
WORKDIR /app
# compile the C source code
RUN gcc -o sample sample.c 

FROM --platform=x86_64 alpine:3.21.3
LABEL maintainer="My Name"
LABEL description="Sample Dockerfile for a simple Alpine container"
# Install necessary packages to run C app
RUN apk update && \
    apk add --no-cache libc6-compat && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /app
COPY --from=compiler /app/sample /app/sample
# Set the working directory
WORKDIR /app
# run C app to display a message
CMD ["./sample"]
