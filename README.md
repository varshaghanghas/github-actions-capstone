# GitHub Actions Capstone Project

An end-to-end cloud-native microservice boilerplate constructed to validate automated testing, compilation pipelines, and continuous delivery orchestration.

## Features
- **Express API**: Exposes a stateless `/health` endpoint for validation.
- **Automated Validation**: Includes a lightweight shell automation suite testing endpoint stability.
- **Optimized Packaging**: Implements a secure multi-stage Alpine Docker runtime.

## 📊 Pipeline Status Badges
[PR Validation Pipeline Status](https://github.com)
[Production Deployment Pipeline Status](https://github.com)
[Scheduled Health Check Status](https://github.com)

## Features
- **Express API**: Exposes a stateless `/health` endpoint for validation.
- **Automated Validation**: Includes a lightweight shell automation suite testing endpoint stability.
- **Optimized Packaging**: Implements a secure multi-stage Alpine Docker runtime.

## 🏗️ Pipeline Architecture Diagram

```text
PR opened ──► Call Reusable Workflow ──► Run Lint & Tests ──► PR Checks Pass

Merge to main ──► Run Tests ──► Docker Build & Push (Docker Hub) ──► Environment Approval Gate ──► Deploy

Every 12 hours (Cron) ──► Pull Image ──► Run Container Detached ──► Curl Endpoint Check ──► Run Summary
```

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

# Build and push image on Docker Hub
docker build -t varshaghanghas/github-actions-capstone:test-run .
docker push varshaghanghas/github-actions-capstone:test-run

# Re-build multi-architecture image for AMD64 GitHub runner compatibility
docker buildx build --platform linux/amd64 -t varshaghanghas/github-actions-capstone:test-run --push .
```

Now open browser with `http://localhost:8080/health`

---

## 🔮 Future Engineering Notes (What's Next?)
To scale this production-style pipeline further, the next logical implementations are:
1. **Slack/Discord Notifications**: Add custom incoming webhooks to instantly notify the team when a deployment is waiting for manual approval, or if the scheduled 12-hour health check fails.
2. **Multi-Environment Staging Progression**: Introduce a `staging` environment protection gate before `production` to test real container endpoints automatically before requesting human verification.
3. **Automated Rollback Scripts**: Configure the workflow to catch bad deployments using live traffic smoke tests. If a deployment fails, it should automatically redeploy the previous stable image tag (`sha-<previous-commit-hash>`).
