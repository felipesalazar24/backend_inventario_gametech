# Use the Eclipse temurin alpine official image
FROM eclipse-temurin:21-jdk-alpine

# Create and change to the app directory.
WORKDIR /app

# Copy local code to the container image.
COPY . .

# Fix Windows CRLF if needed and give execute permission
RUN sed -i 's/\r$//' gradlew && chmod +x gradlew

# Build the app
RUN ./gradlew clean build -x test

# Run the final JAR
CMD ["sh", "-c", "java -jar build/libs/Inventario-0.0.1-SNAPSHOT.jar"]
