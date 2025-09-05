# Hệ thống Tra cứu Luật Lao động cho Người Việt tại Đài Loan

## 🎯 Mô tả dự án

Hệ thống tra cứu thông tin pháp luật lao động dễ sử dụng cho người Việt Nam có trình độ tiếng Trung kém tại Đài Loan. Hệ thống sử dụng AI để dịch thuật và giải thích các văn bản luật pháp từ tiếng Trung sang tiếng Việt.

## ✨ Tính năng chính

- 🔍 **Tìm kiếm thông minh** theo từ khóa tiếng Việt hoặc tiếng Trung
- 🤖 **AI dịch thuật** chuyên ngành pháp luật
- 📚 **Từ điển thuật ngữ** pháp luật tương tác
- 📋 **Chủ đề thường gặp** được tổ chức rõ ràng
- 📱 **Giao diện thân thiện** dễ sử dụng

## 🏗️ Kiến trúc hệ thống

```
viet-tai-law-ai/
├── frontend/          # React.js frontend
├── backend/           # FastAPI backend
├── database/          # PostgreSQL database
├── ai-services/       # AI translation services
├── docker-compose.yml # Docker orchestration
└── .github/workflows/ # CI/CD pipeline
```

## 🚀 Cài đặt và chạy

### Yêu cầu hệ thống

- Docker & Docker Compose
- Node.js 18+
- Python 3.9+
- PostgreSQL 13+
- Redis 6+

### Cài đặt với Docker (Khuyến nghị)

1. **Clone repository:**
```bash
git clone https://github.com/username/viet-tai-law-ai.git
cd viet-tai-law-ai
```

2. **Tạo file environment:**
```bash
cp .env.example .env
# Chỉnh sửa các biến môi trường trong .env
```

3. **Chạy với Docker Compose:**
```bash
docker-compose up -d
```

4. **Truy cập ứng dụng:**
- Frontend: http://localhost:3000
- Backend API: http://localhost:8000
- Database: localhost:5432

### Cài đặt thủ công

#### Backend

```bash
cd backend
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```

#### Frontend

```bash
cd frontend
npm install
npm start
```

## 🧪 Testing

### Chạy tests

```bash
# Backend tests
cd backend
pytest tests/ -v

# Frontend tests
cd frontend
npm test

# E2E tests
npm run test:e2e
```

### Test coverage

```bash
# Backend coverage
cd backend
pytest --cov=app tests/

# Frontend coverage
cd frontend
npm run test:coverage
```

## 🔧 CI/CD Pipeline

Hệ thống sử dụng GitHub Actions để:

- ✅ **Code Quality Check:** Linting, type checking
- ✅ **Build & Test:** Unit tests, integration tests
- ✅ **Security Scan:** Vulnerability scanning
- ✅ **Docker Build:** Build và push Docker images
- ✅ **Deploy:** Tự động deploy staging/production

### Workflow files

- `.github/workflows/ci-cd.yml` - Main CI/CD pipeline
- `.github/workflows/security.yml` - Security scanning
- `.github/workflows/performance.yml` - Performance testing

## 📊 Monitoring

- **Health Checks:** `/health` endpoint
- **Metrics:** Prometheus metrics tại `/metrics`
- **Logs:** Structured logging với JSON format
- **Database:** Connection pooling và query optimization

## 🔐 Security

- **Authentication:** JWT tokens
- **Authorization:** Role-based access control
- **Data Encryption:** HTTPS, database encryption
- **Input Validation:** Pydantic models
- **Rate Limiting:** API rate limiting
- **CORS:** Configured for production

## 📚 API Documentation

### Endpoints chính

- `GET /api/law/search` - Tìm kiếm luật
- `GET /api/law/{id}` - Lấy chi tiết điều luật
- `POST /api/translate` - Dịch văn bản
- `GET /api/terms/{term}` - Tra cứu thuật ngữ
- `GET /api/health` - Health check

### API Documentation

- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

## 🗄️ Database Schema

### Bảng chính

- `law_articles` - Điều luật
- `legal_terms` - Thuật ngữ pháp luật
- `search_logs` - Log tìm kiếm
- `user_feedback` - Phản hồi người dùng

## 🤖 AI Services

### Translation Service

- **Google Translate API** - Dịch cơ bản
- **Custom Legal Model** - Dịch chuyên ngành
- **Term Recognition** - Nhận diện thuật ngữ
- **Context Analysis** - Phân tích ngữ cảnh

### Search Service

- **Full-text Search** - PostgreSQL full-text
- **Semantic Search** - Vector embeddings
- **Fuzzy Matching** - Tìm kiếm gần đúng
- **Auto-suggestions** - Gợi ý từ khóa

## 📱 Frontend Features

### Components chính

- `SearchPage` - Trang tìm kiếm
- `LawArticle` - Hiển thị điều luật
- `LegalDictionary` - Từ điển thuật ngữ
- `QuickFilters` - Bộ lọc nhanh

### State Management

- **React Query** - Server state
- **Context API** - Global state
- **Local Storage** - User preferences

## 🚀 Deployment

### Production Environment

```bash
# Build production images
docker-compose -f docker-compose.prod.yml build

# Deploy to production
docker-compose -f docker-compose.prod.yml up -d
```

### Environment Variables

```bash
# Database
DATABASE_URL=postgresql://user:pass@host:port/db

# Redis
REDIS_URL=redis://host:port

# AI Services
GOOGLE_TRANSLATE_API_KEY=your_key
OPENAI_API_KEY=your_key

# Security
JWT_SECRET_KEY=your_secret
```

## 📈 Performance

### Optimization

- **Database Indexing** - Optimized queries
- **Caching** - Redis caching
- **CDN** - Static asset delivery
- **Compression** - Gzip compression
- **Lazy Loading** - Code splitting

### Monitoring

- **Response Time** - < 2s for search
- **Throughput** - 1000+ concurrent users
- **Uptime** - 99.9% availability
- **Error Rate** - < 0.1%

## 🤝 Contributing

1. Fork repository
2. Tạo feature branch: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'Add amazing feature'`
4. Push to branch: `git push origin feature/amazing-feature`
5. Tạo Pull Request

### Development Guidelines

- **Code Style:** ESLint + Prettier
- **Type Safety:** TypeScript strict mode
- **Testing:** 80%+ test coverage
- **Documentation:** JSDoc comments
- **Commits:** Conventional commits

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

## 📞 Support

- **Issues:** GitHub Issues
- **Discussions:** GitHub Discussions
- **Email:** support@law-search.com
- **Documentation:** [Wiki](https://github.com/username/viet-tai-law-ai/wiki)

## 🙏 Acknowledgments

- **Legal Content:** Taiwan Labor Standards Act
- **AI Translation:** Google Translate API
- **UI Framework:** Material-UI
- **Backend Framework:** FastAPI
- **Database:** PostgreSQL

---

**Made with ❤️ for Vietnamese workers in Taiwan**
No changes to commit. Creating initial commit...
- AI translation (Chinese to Vietnamese
- Legal terms dictionary 
- User-friendly interface 
 
## Setup 
1. Clone the repository 
2. Run docker-compose up 
3. Access the application at http://localhost:3000 
