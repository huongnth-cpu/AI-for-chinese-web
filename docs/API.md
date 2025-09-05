# API DOCUMENTATION

## 🔗 Base URL
```
Development: http://localhost:8000
Production: https://api.law-search.com
```

## 🔐 Authentication
All API endpoints require JWT authentication except for public endpoints.

```http
Authorization: Bearer <jwt_token>
```

## 📋 Endpoints

### 1. Law Search

#### Search Law Articles
```http
GET /api/law/search?q={query}&type={type}&difficulty={level}
```

**Parameters:**
- `q` (string, required): Search query in Vietnamese or Chinese
- `type` (string, optional): Law type filter (`labor`, `employment`, `insurance`)
- `difficulty` (integer, optional): Difficulty level (1-5)

**Response:**
```json
{
  "success": true,
  "data": {
    "results": [
      {
        "id": 1,
        "law_type": "勞動基準法",
        "article_number": "第21條",
        "title_zh": "工資給付",
        "title_vi": "Trả lương",
        "content_zh": "工資由勞雇雙方議定之...",
        "content_vi": "Tiền lương được thỏa thuận...",
        "difficulty_level": 2,
        "legal_terms": ["工資", "勞雇雙方", "基本工資"],
        "related_articles": [2, 3, 4]
      }
    ],
    "total": 1,
    "page": 1,
    "per_page": 10
  },
  "message": "Search completed successfully"
}
```

#### Get Law Article Details
```http
GET /api/law/{id}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "id": 1,
    "law_type": "勞動基準法",
    "article_number": "第21條",
    "title_zh": "工資給付",
    "title_vi": "Trả lương",
    "content_zh": "工資由勞雇雙方議定之。但不得低於基本工資。",
    "content_vi": "Tiền lương được thỏa thuận giữa người lao động và người sử dụng lao động. Tuy nhiên, không được thấp hơn mức lương cơ bản.",
    "difficulty_level": 2,
    "legal_terms": [
      {
        "term_zh": "工資",
        "term_vi": "tiền lương",
        "definition_vi": "Số tiền mà người lao động nhận được từ người sử dụng lao động",
        "examples": ["基本工資", "加班費"]
      }
    ],
    "related_articles": [
      {
        "id": 2,
        "title_vi": "工資給付方式",
        "article_number": "第22條"
      }
    ]
  }
}
```

### 2. Translation Service

#### Translate Text
```http
POST /api/translate
```

**Request Body:**
```json
{
  "text": "工資由勞雇雙方議定之",
  "target_lang": "vi",
  "context": "legal"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "original": "工資由勞雇雙方議定之",
    "translated": "Tiền lương được thỏa thuận giữa người lao động và người sử dụng lao động",
    "confidence": 0.95,
    "source_lang": "zh",
    "target_lang": "vi",
    "legal_terms": [
      {
        "term": "工資",
        "translation": "tiền lương",
        "definition": "Số tiền mà người lao động nhận được"
      }
    ]
  }
}
```

### 3. Legal Terms Dictionary

#### Search Legal Terms
```http
GET /api/terms/search?q={query}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "results": [
      {
        "id": 1,
        "term_zh": "工資",
        "term_vi": "tiền lương",
        "definition_zh": "勞工因工作而獲得之報酬",
        "definition_vi": "Số tiền mà người lao động nhận được từ người sử dụng lao động",
        "category": "salary",
        "difficulty": "beginner",
        "examples": [
          "基本工資 (lương cơ bản)",
          "加班費 (tiền làm thêm giờ)"
        ],
        "related_terms": ["薪資", "報酬", "工錢"]
      }
    ]
  }
}
```

#### Get Term Definition
```http
GET /api/terms/{term}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "term_zh": "工資",
    "term_vi": "tiền lương",
    "definition_zh": "勞工因工作而獲得之報酬",
    "definition_vi": "Số tiền mà người lao động nhận được từ người sử dụng lao động",
    "category": "salary",
    "difficulty": "beginner",
    "usage_context": "Hợp đồng lao động, Bảng lương, Tranh chấp lương",
    "examples": [
      {
        "zh": "基本工資",
        "vi": "lương cơ bản",
        "context": "最低工資標準"
      }
    ],
    "related_terms": [
      {
        "term_zh": "薪資",
        "term_vi": "tiền lương",
        "similarity": 0.9
      }
    ]
  }
}
```

### 4. User Management

#### User Registration
```http
POST /api/auth/register
```

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "password123",
  "full_name": "Nguyễn Văn A",
  "chinese_level": "intermediate"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "user_id": 1,
    "email": "user@example.com",
    "full_name": "Nguyễn Văn A",
    "chinese_level": "intermediate",
    "created_at": "2024-01-15T10:30:00Z"
  },
  "message": "User registered successfully"
}
```

#### User Login
```http
POST /api/auth/login
```

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
    "token_type": "bearer",
    "expires_in": 3600,
    "user": {
      "id": 1,
      "email": "user@example.com",
      "full_name": "Nguyễn Văn A",
      "chinese_level": "intermediate"
    }
  }
}
```

### 5. Analytics & Monitoring

#### Get Search Analytics
```http
GET /api/analytics/search?period={days}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "total_searches": 1250,
    "unique_users": 45,
    "popular_queries": [
      {
        "query": "lương tối thiểu",
        "count": 25
      },
      {
        "query": "giờ làm việc",
        "count": 18
      }
    ],
    "search_success_rate": 0.95,
    "average_response_time": 1.2
  }
}
```

#### Health Check
```http
GET /api/health
```

**Response:**
```json
{
  "success": true,
  "data": {
    "status": "healthy",
    "timestamp": "2024-01-15T10:30:00Z",
    "version": "1.0.0",
    "services": {
      "database": "healthy",
      "redis": "healthy",
      "ai_translation": "healthy"
    },
    "uptime": 86400
  }
}
```

## 📊 Error Responses

### Standard Error Format
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input parameters",
    "details": {
      "field": "query",
      "issue": "Query cannot be empty"
    }
  },
  "timestamp": "2024-01-15T10:30:00Z"
}
```

### Error Codes
- `VALIDATION_ERROR` (400): Invalid input parameters
- `UNAUTHORIZED` (401): Authentication required
- `FORBIDDEN` (403): Insufficient permissions
- `NOT_FOUND` (404): Resource not found
- `RATE_LIMIT_EXCEEDED` (429): Too many requests
- `INTERNAL_ERROR` (500): Server error
- `SERVICE_UNAVAILABLE` (503): External service unavailable

## 🔒 Rate Limiting

### Limits
- **Search API:** 100 requests per minute per user
- **Translation API:** 50 requests per minute per user
- **General API:** 1000 requests per hour per IP

### Headers
```http
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1642248600
```

## 📝 Request/Response Examples

### Search Example
```bash
curl -X GET "http://localhost:8000/api/law/search?q=lương tối thiểu&type=labor" \
  -H "Authorization: Bearer your_jwt_token"
```

### Translation Example
```bash
curl -X POST "http://localhost:8000/api/translate" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your_jwt_token" \
  -d '{
    "text": "工資由勞雇雙方議定之",
    "target_lang": "vi",
    "context": "legal"
  }'
```

## 🔧 SDK Examples

### JavaScript/TypeScript
```typescript
import { LawSearchAPI } from './law-search-sdk';

const api = new LawSearchAPI('http://localhost:8000', 'your_jwt_token');

// Search law articles
const results = await api.searchLaw({
  query: 'lương tối thiểu',
  type: 'labor',
  difficulty: 2
});

// Translate text
const translation = await api.translate({
  text: '工資由勞雇雙方議定之',
  target_lang: 'vi'
});
```

### Python
```python
from law_search_sdk import LawSearchClient

client = LawSearchClient('http://localhost:8000', 'your_jwt_token')

# Search law articles
results = client.search_law(
    query='lương tối thiểu',
    law_type='labor',
    difficulty=2
)

# Translate text
translation = client.translate(
    text='工資由勞雇雙方議定之',
    target_lang='vi'
)
```

---

**For more examples and detailed documentation, visit the interactive API docs at `/docs`**
