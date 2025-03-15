 
# Use the official Redis image as the base image
FROM redis:alpine

# Optionally, copy a custom Redis configuration file into the container
# (If you have a custom redis.conf, you can copy it here)
# COPY redis.conf /usr/local/etc/redis/redis.conf

# Set the working directory to Redis config directory (optional)
WORKDIR /usr/local/etc/redis

# Expose the default Redis port (6379)
EXPOSE 6379

# Set the entrypoint to start Redis with custom configuration
# If you have a custom config, uncomment the next line
# CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]

# By default, it will run Redis without any configuration file, just the default config
CMD ["redis-server"]
