# URL Shortener (System Design Practice)
A small URL shortener built to practice how an API server, a database, and a cache layer work together. It takes a long link and returns a short one that redirects to the original, similar to Bitly or TinyURL.

## Tech Stack
- **Python + Flask**: API server
- **PostgreSQL**: stores each short code and its long URL
- **Redis**: cache for fast lookups of popular links
- **Docker Compose**: runs all services together
- **GitHub Codespaces**: cloud development environment

## How It Works
1. A user submits a long URL to the Flask API.
2. The API stores it in PostgreSQL and gets back an ID.
3. The ID is encoded into a short code, which forms the short URL.
4. Redis caches lookups so repeat visits skip the database.

## Run It
```bash
docker compose up --build
```

## Status
In progress. Following the NextWork project steps and adding my own notes along the way.