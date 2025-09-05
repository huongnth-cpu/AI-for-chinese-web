# DEPLOYMENT GUIDE

## 🚀 Quick Start

### Prerequisites
- Docker & Docker Compose
- Git
- 4GB RAM minimum
- 10GB disk space

### 1. Clone Repository
```bash
git clone https://github.com/huongnth-cpu/AI-for-chinese-web.git
cd AI-for-chinese-web
```

### 2. Setup Environment
```bash
# Copy environment file
cp env.example .env

# Edit environment variables
nano .env
```

### 3. Start Development Environment
```bash
# Start all services
docker-compose up -d

# Check status
docker-compose ps
```

### 4. Access Application
- **Frontend:** http://localhost:3000
- **Backend API:** http://localhost:8000
- **API Docs:** http://localhost:8000/docs

## 🐳 Docker Deployment

### Development Environment
```yaml
# docker-compose.yml
version: '3.8'
services:
  frontend:
    build: ./frontend
    ports:
      - "3000:3000"
    environment:
      - REACT_APP_API_URL=http://localhost:8000
    volumes:
      - ./frontend:/app
      - /app/node_modules

  backend:
    build: ./backend
    ports:
      - "8000:8000"
    environment:
      - DATABASE_URL=postgresql://postgres:postgres@db:5432/law_search
      - REDIS_URL=redis://redis:6379
    depends_on:
      - db
      - redis

  db:
    image: postgres:13
    environment:
      - POSTGRES_DB=law_search
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

  redis:
    image: redis:6-alpine
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data
```

### Production Environment
```yaml
# docker-compose.prod.yml
version: '3.8'
services:
  frontend:
    build:
      context: ./frontend
      dockerfile: Dockerfile.prod
    ports:
      - "80:80"
    environment:
      - NODE_ENV=production
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf

  backend:
    build:
      context: ./backend
      dockerfile: Dockerfile.prod
    ports:
      - "8000:8000"
    environment:
      - DATABASE_URL=${DATABASE_URL}
      - REDIS_URL=${REDIS_URL}
      - JWT_SECRET_KEY=${JWT_SECRET_KEY}
    depends_on:
      - db
      - redis

  db:
    image: postgres:13
    environment:
      - POSTGRES_DB=${POSTGRES_DB}
      - POSTGRES_USER=${POSTGRES_USER}
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./backups:/backups

  redis:
    image: redis:6-alpine
    volumes:
      - redis_data:/data
    command: redis-server --appendonly yes

  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf
      - ./ssl:/etc/nginx/ssl
    depends_on:
      - frontend
      - backend
```

## ☁️ Cloud Deployment

### AWS Deployment

#### 1. EC2 Instance Setup
```bash
# Launch EC2 instance (t3.medium or larger)
# Install Docker
sudo yum update -y
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

#### 2. RDS Database Setup
```bash
# Create RDS PostgreSQL instance
# Engine: PostgreSQL 13
# Instance class: db.t3.micro
# Storage: 20GB
# Security group: Allow port 5432 from EC2
```

#### 3. ElastiCache Redis Setup
```bash
# Create ElastiCache Redis cluster
# Node type: cache.t3.micro
# Security group: Allow port 6379 from EC2
```

#### 4. Deploy Application
```bash
# Clone repository
git clone https://github.com/huongnth-cpu/AI-for-chinese-web.git
cd AI-for-chinese-web

# Setup environment
cp env.example .env
# Edit .env with RDS and ElastiCache endpoints

# Deploy
docker-compose -f docker-compose.prod.yml up -d
```

### Google Cloud Platform

#### 1. Cloud Run Deployment
```bash
# Build and push images
gcloud builds submit --tag gcr.io/PROJECT_ID/law-search-frontend
gcloud builds submit --tag gcr.io/PROJECT_ID/law-search-backend

# Deploy to Cloud Run
gcloud run deploy law-search-frontend --image gcr.io/PROJECT_ID/law-search-frontend
gcloud run deploy law-search-backend --image gcr.io/PROJECT_ID/law-search-backend
```

#### 2. Cloud SQL Setup
```bash
# Create Cloud SQL PostgreSQL instance
gcloud sql instances create law-search-db \
  --database-version=POSTGRES_13 \
  --tier=db-f1-micro \
  --region=asia-southeast1
```

### Azure Deployment

#### 1. Container Instances
```bash
# Deploy with Azure Container Instances
az container create \
  --resource-group myResourceGroup \
  --name law-search-app \
  --image myregistry.azurecr.io/law-search:latest \
  --cpu 2 \
  --memory 4 \
  --ports 80 443
```

## 🔧 Environment Configuration

### Required Environment Variables
```bash
# Database
DATABASE_URL=postgresql://user:password@host:port/database
POSTGRES_DB=law_search
POSTGRES_USER=postgres
POSTGRES_PASSWORD=your_password

# Redis
REDIS_URL=redis://host:port

# AI Services
GOOGLE_TRANSLATE_API_KEY=your_api_key
OPENAI_API_KEY=your_api_key

# Security
JWT_SECRET_KEY=your_secret_key
JWT_ALGORITHM=HS256
JWT_ACCESS_TOKEN_EXPIRE_MINUTES=30

# Application
APP_NAME=Law Search System
DEBUG=False
LOG_LEVEL=INFO

# Frontend
REACT_APP_API_URL=https://api.law-search.com
REACT_APP_GOOGLE_TRANSLATE_API_KEY=your_api_key
```

### Production Environment Variables
```bash
# Database (Production)
DATABASE_URL=postgresql://prod_user:secure_password@prod_host:5432/law_search_prod

# Redis (Production)
REDIS_URL=redis://prod_redis_host:6379

# Security (Production)
JWT_SECRET_KEY=very_secure_secret_key_here
CORS_ORIGINS=["https://law-search.com", "https://www.law-search.com"]

# Monitoring
PROMETHEUS_ENABLED=True
PROMETHEUS_PORT=9090

# SSL
SSL_CERT_PATH=/etc/nginx/ssl/cert.pem
SSL_KEY_PATH=/etc/nginx/ssl/key.pem
```

## 🔒 SSL/TLS Configuration

### Let's Encrypt SSL
```bash
# Install Certbot
sudo apt-get update
sudo apt-get install certbot python3-certbot-nginx

# Get SSL certificate
sudo certbot --nginx -d law-search.com -d www.law-search.com

# Auto-renewal
sudo crontab -e
# Add: 0 12 * * * /usr/bin/certbot renew --quiet
```

### Nginx SSL Configuration
```nginx
server {
    listen 443 ssl http2;
    server_name law-search.com www.law-search.com;
    
    ssl_certificate /etc/letsencrypt/live/law-search.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/law-search.com/privkey.pem;
    
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512;
    ssl_prefer_server_ciphers off;
    
    location / {
        proxy_pass http://frontend:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
    
    location /api/ {
        proxy_pass http://backend:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

## 📊 Monitoring & Logging

### Prometheus Configuration
```yaml
# prometheus.yml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'law-search-backend'
    static_configs:
      - targets: ['backend:8000']
    metrics_path: '/metrics'
    
  - job_name: 'law-search-frontend'
    static_configs:
      - targets: ['frontend:3000']
    metrics_path: '/metrics'
```

### Grafana Dashboard
```json
{
  "dashboard": {
    "title": "Law Search System",
    "panels": [
      {
        "title": "Request Rate",
        "type": "graph",
        "targets": [
          {
            "expr": "rate(http_requests_total[5m])",
            "legendFormat": "{{method}} {{endpoint}}"
          }
        ]
      }
    ]
  }
}
```

### Log Aggregation
```yaml
# docker-compose.logging.yml
version: '3.8'
services:
  elasticsearch:
    image: elasticsearch:7.17.0
    environment:
      - discovery.type=single-node
    ports:
      - "9200:9200"
    volumes:
      - elasticsearch_data:/usr/share/elasticsearch/data

  kibana:
    image: kibana:7.17.0
    ports:
      - "5601:5601"
    environment:
      - ELASTICSEARCH_HOSTS=http://elasticsearch:9200
    depends_on:
      - elasticsearch

  logstash:
    image: logstash:7.17.0
    volumes:
      - ./logstash/pipeline:/usr/share/logstash/pipeline
    depends_on:
      - elasticsearch
```

## 🔄 CI/CD Pipeline

### GitHub Actions Workflow
```yaml
# .github/workflows/deploy.yml
name: Deploy to Production

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Deploy to AWS
        run: |
          # Deploy to EC2
          ssh -i ${{ secrets.SSH_KEY }} ec2-user@${{ secrets.EC2_HOST }} '
            cd /home/ec2-user/law-search &&
            git pull origin main &&
            docker-compose -f docker-compose.prod.yml up -d --build
          '
```

### Automated Deployment Script
```bash
#!/bin/bash
# deploy.sh

echo "Starting deployment..."

# Pull latest code
git pull origin main

# Build and deploy
docker-compose -f docker-compose.prod.yml down
docker-compose -f docker-compose.prod.yml up -d --build

# Run migrations
docker-compose -f docker-compose.prod.yml exec backend alembic upgrade head

# Health check
sleep 30
curl -f http://localhost:8000/health || exit 1

echo "Deployment completed successfully!"
```

## 🚨 Backup & Recovery

### Database Backup
```bash
#!/bin/bash
# backup.sh

# Create backup
docker-compose exec db pg_dump -U postgres law_search > backup_$(date +%Y%m%d_%H%M%S).sql

# Upload to S3
aws s3 cp backup_*.sql s3://law-search-backups/

# Cleanup old backups
find . -name "backup_*.sql" -mtime +7 -delete
```

### Disaster Recovery
```bash
#!/bin/bash
# restore.sh

# Download latest backup
aws s3 cp s3://law-search-backups/latest.sql .

# Restore database
docker-compose exec -T db psql -U postgres law_search < latest.sql

echo "Database restored successfully!"
```

## 📈 Performance Optimization

### Database Optimization
```sql
-- Create indexes
CREATE INDEX idx_law_articles_content_zh ON law_articles USING gin(to_tsvector('chinese', content_zh));
CREATE INDEX idx_law_articles_content_vi ON law_articles USING gin(to_tsvector('vietnamese', content_vi));
CREATE INDEX idx_legal_terms_term_zh ON legal_terms(term_zh);
CREATE INDEX idx_legal_terms_term_vi ON legal_terms(term_vi);

-- Optimize queries
ANALYZE law_articles;
ANALYZE legal_terms;
```

### Caching Strategy
```python
# Redis caching
import redis
from functools import wraps

redis_client = redis.Redis(host='redis', port=6379, db=0)

def cache_result(expiration=3600):
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            cache_key = f"{func.__name__}:{hash(str(args) + str(kwargs))}"
            
            # Try cache first
            cached = redis_client.get(cache_key)
            if cached:
                return json.loads(cached)
            
            # Execute function
            result = func(*args, **kwargs)
            
            # Cache result
            redis_client.setex(cache_key, expiration, json.dumps(result))
            return result
        return wrapper
    return decorator
```

## 🔍 Troubleshooting

### Common Issues

#### 1. Database Connection Error
```bash
# Check database status
docker-compose logs db

# Test connection
docker-compose exec backend python -c "from sqlalchemy import create_engine; create_engine('postgresql://postgres:postgres@db:5432/law_search').connect()"
```

#### 2. Redis Connection Error
```bash
# Check Redis status
docker-compose logs redis

# Test connection
docker-compose exec backend python -c "import redis; redis.Redis(host='redis', port=6379).ping()"
```

#### 3. Frontend Build Error
```bash
# Check frontend logs
docker-compose logs frontend

# Rebuild frontend
docker-compose build --no-cache frontend
```

### Health Checks
```bash
# Check all services
docker-compose ps

# Check logs
docker-compose logs

# Check resource usage
docker stats

# Check disk space
df -h
```

---

**For more detailed troubleshooting, check the logs and monitor the system metrics.**
