# GitHub Actions Capstone Project

An end-to-end cloud-native microservice boilerplate constructed to validate automated testing, compilation pipelines, and continuous delivery orchestration.

## Features
- **Express API**: Exposes a stateless `/health` endpoint for validation.
- **Automated Validation**: Includes a lightweight shell automation suite testing endpoint stability.
- **Optimized Packaging**: Implements a secure multi-stage Alpine Docker runtime.

## Local Operations
To launch and test the application environment directly on your local system:

```bash
# Install required libraries
npm install

# Execute automated functional testing script
npm test

# Build local target container image
docker build -t capstone-app .

# run container and start app
docker run -d -p 8080:3000 --name my-running-app capstone-app
```

Now open browser with `http://localhost:8080/health`
