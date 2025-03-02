# Use the official n8n image
FROM docker.n8n.io/n8nio/n8n

# Set working directory
WORKDIR /app

# Expose port for n8n
EXPOSE 5678

# Mount a volume for persistent data storage
VOLUME ["/home/node/.n8n"]

# Start n8n automatically
CMD ["n8n"]