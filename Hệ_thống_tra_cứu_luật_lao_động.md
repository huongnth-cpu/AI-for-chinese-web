# HỆ THỐNG TRA CỨU LUẬT LAO ĐỘNG CHO NGƯỜI VIỆT TẠI ĐÀI LOAN

## 🎯 MỤC TIÊU CHÍNH
**Tạo một công cụ tra cứu thông tin pháp luật lao động dễ sử dụng cho người Việt Nam có trình độ tiếng Trung kém tại Đài Loan**

---

## 🔍 ĐẶC ĐIỂM HỆ THỐNG

### **KHÔNG PHẢI LÀ:**
- ❌ Khóa học tiếng Trung
- ❌ Chương trình đào tạo
- ❌ Hệ thống LMS (Learning Management System)
- ❌ Nơi học ngữ pháp

### **LÀ:**
- ✅ **Công cụ tra cứu thông tin** pháp luật
- ✅ **Từ điển thuật ngữ** pháp luật
- ✅ **Hệ thống dịch thuật** AI cho văn bản luật
- ✅ **Cơ sở dữ liệu** luật lao động có tổ chức
- ✅ **Tìm kiếm thông minh** theo từ khóa

---

## 🏗️ KIẾN TRÚC HỆ THỐNG MỚI

### **1. Giao diện chính - Trang tìm kiếm**
```
🔍 SEARCH INTERFACE
├── 📝 Search Box (Tìm kiếm)
│   ├── Input: Tiếng Việt hoặc Tiếng Trung
│   ├── Filters: Loại luật, Độ khó, Chủ đề
│   └── Suggestions: Gợi ý từ khóa
├── 📋 Results Display (Hiển thị kết quả)
│   ├── Law Article (Điều luật)
│   ├── AI Translation (Bản dịch AI)
│   ├── Legal Terms (Thuật ngữ pháp luật)
│   └── Related Articles (Điều luật liên quan)
└── 📚 Quick Access (Truy cập nhanh)
    ├── Common Issues (Vấn đề thường gặp)
    ├── FAQ (Câu hỏi thường gặp)
    └── Emergency Info (Thông tin khẩn cấp)
```

### **2. Cơ sở dữ liệu thông tin**
```
📚 LAW DATABASE
├── 🏢 Labor Standards Act (勞動基準法)
│   ├── Salary & Wages (Lương thưởng)
│   ├── Working Hours (Giờ làm việc)
│   ├── Leave & Holidays (Nghỉ phép)
│   ├── Overtime (Làm thêm giờ)
│   └── Termination (Chấm dứt hợp đồng)
├── 💼 Employment Services Act (就業服務法)
│   ├── Foreign Workers (Lao động nước ngoài)
│   ├── Work Permits (Giấy phép lao động)
│   ├── Labor Broker (Môi giới lao động)
│   └── Violations (Vi phạm)
└── 🏥 Labor Insurance (勞工保險)
    ├── Insurance Coverage (Bảo hiểm)
    ├── Premiums (Phí bảo hiểm)
    ├── Benefits (Quyền lợi)
    └── Claims (Khiếu nại)
```

---

## 🛠️ TÍNH NĂNG CHÍNH

### **1. Tìm kiếm thông minh**
```javascript
// Ví dụ tìm kiếm
User input: "lương tối thiểu"
System response:
- Tìm thấy: 勞動基準法 第21條 (工資給付)
- Hiển thị: Bản dịch tiếng Việt
- Giải thích: Thuật ngữ pháp luật
- Liên quan: Các điều luật về lương
```

### **2. AI Dịch thuật pháp luật**
```python
# AI Translation Service
def translate_law_article(article_text, target_lang='vi'):
    """
    Dịch văn bản luật từ tiếng Trung sang tiếng Việt
    với giải thích thuật ngữ pháp luật
    """
    translation = ai_translate(article_text, target_lang)
    legal_terms = extract_legal_terms(article_text)
    explanations = get_term_explanations(legal_terms)
    
    return {
        "original": article_text,
        "translated": translation,
        "legal_terms": legal_terms,
        "explanations": explanations
    }
```

### **3. Từ điển thuật ngữ tương tác**
```json
{
  "工資": {
    "vi": "tiền lương",
    "definition": "Số tiền mà người lao động nhận được từ người sử dụng lao động",
    "examples": [
      "基本工資 (lương cơ bản)",
      "加班費 (tiền làm thêm giờ)"
    ],
    "related_terms": ["薪資", "報酬", "工錢"],
    "usage_context": "Hợp đồng lao động, Bảng lương, Tranh chấp lương"
  }
}
```

### **4. Chủ đề thường gặp**
```markdown
📋 COMMON TOPICS
├── 💰 Lương thưởng
│   ├── Lương tối thiểu
│   ├── Lương làm thêm giờ
│   ├── Thưởng cuối năm
│   └── Khấu trừ lương
├── ⏰ Giờ làm việc
│   ├── Giờ làm việc bình thường
│   ├── Làm thêm giờ
│   ├── Nghỉ giữa ca
│   └── Làm việc cuối tuần
├── 🏖️ Nghỉ phép
│   ├── Nghỉ phép năm
│   ├── Nghỉ ốm
│   ├── Nghỉ thai sản
│   └── Nghỉ lễ
└── ⚖️ Tranh chấp lao động
    ├── Khiếu nại lương
    ├── Vi phạm hợp đồng
    ├── Quấy rối tình dục
    └── Phân biệt đối xử
```

---

## 🎨 GIAO DIỆN NGƯỜI DÙNG

### **Trang chủ - Tìm kiếm**
```html
<!-- Search Page -->
<div class="search-container">
  <h1>Tra cứu Luật Lao động Đài Loan</h1>
  
  <!-- Search Box -->
  <div class="search-box">
    <input type="text" placeholder="Nhập từ khóa tìm kiếm...">
    <button>Tìm kiếm</button>
  </div>
  
  <!-- Quick Filters -->
  <div class="quick-filters">
    <button class="filter-btn">Lương thưởng</button>
    <button class="filter-btn">Giờ làm việc</button>
    <button class="filter-btn">Nghỉ phép</button>
    <button class="filter-btn">Tranh chấp</button>
  </div>
  
  <!-- Search Results -->
  <div class="results">
    <!-- Law articles will be displayed here -->
  </div>
</div>
```

### **Trang kết quả tìm kiếm**
```html
<!-- Search Results -->
<div class="search-result">
  <div class="law-article">
    <h3>勞動基準法 第21條 - 工資給付</h3>
    
    <!-- Original Chinese -->
    <div class="original-text">
      <h4>Tiếng Trung:</h4>
      <p>工資由勞雇雙方議定之。但不得低於基本工資。</p>
    </div>
    
    <!-- AI Translation -->
    <div class="ai-translation">
      <h4>Bản dịch AI:</h4>
      <p>Tiền lương được thỏa thuận giữa người lao động và người sử dụng lao động. Tuy nhiên, không được thấp hơn mức lương cơ bản.</p>
    </div>
    
    <!-- Legal Terms -->
    <div class="legal-terms">
      <h4>Thuật ngữ pháp luật:</h4>
      <ul>
        <li><strong>工資</strong> - tiền lương</li>
        <li><strong>勞雇雙方</strong> - người lao động và người sử dụng lao động</li>
        <li><strong>基本工資</strong> - lương cơ bản</li>
      </ul>
    </div>
    
    <!-- Related Articles -->
    <div class="related-articles">
      <h4>Điều luật liên quan:</h4>
      <ul>
        <li><a href="#">第22條 - 工資給付方式</a></li>
        <li><a href="#">第23條 - 工資給付時間</a></li>
      </ul>
    </div>
  </div>
</div>
```

---

## 🔧 CÔNG NGHỆ SỬ DỤNG

### **Backend Services**
```python
# Core Services
class LawSearchService:
    def search_law(self, query, filters=None):
        """Tìm kiếm luật theo từ khóa"""
        pass
    
    def get_article_detail(self, article_id):
        """Lấy chi tiết điều luật"""
        pass
    
    def get_related_articles(self, article_id):
        """Lấy điều luật liên quan"""
        pass

class TranslationService:
    def translate_article(self, text, target_lang='vi'):
        """Dịch văn bản luật"""
        pass
    
    def get_legal_terms(self, text):
        """Trích xuất thuật ngữ pháp luật"""
        pass

class LegalTermsService:
    def get_term_definition(self, term):
        """Lấy định nghĩa thuật ngữ"""
        pass
    
    def get_related_terms(self, term):
        """Lấy thuật ngữ liên quan"""
        pass
```

### **Frontend Components**
```javascript
// React Components
const SearchPage = () => {
  const [query, setQuery] = useState('');
  const [results, setResults] = useState([]);
  const [loading, setLoading] = useState(false);

  const handleSearch = async () => {
    setLoading(true);
    const response = await api.searchLaw(query);
    setResults(response.data);
    setLoading(false);
  };

  return (
    <div className="search-page">
      <SearchBox onSearch={handleSearch} />
      <SearchResults results={results} />
    </div>
  );
};

const LawArticle = ({ article }) => {
  return (
    <div className="law-article">
      <h3>{article.title_vi}</h3>
      <OriginalText text={article.content_zh} />
      <AITranslation text={article.content_vi} />
      <LegalTerms terms={article.legal_terms} />
      <RelatedArticles articles={article.related} />
    </div>
  );
};
```

---

## 📊 CƠ SỞ DỮ LIỆU

### **Database Schema**
```sql
-- Law Articles Table
CREATE TABLE law_articles (
    id SERIAL PRIMARY KEY,
    law_type VARCHAR(50), -- 勞動基準法, 就業服務法
    article_number VARCHAR(20), -- 第21條
    title_zh TEXT, -- 工資給付
    content_zh TEXT, -- Nội dung tiếng Trung
    title_vi TEXT, -- Trả lương
    content_vi TEXT, -- Nội dung tiếng Việt
    category VARCHAR(50), -- salary, working_hours, leave
    difficulty_level INTEGER, -- 1-5
    created_at TIMESTAMP DEFAULT NOW()
);

-- Legal Terms Dictionary
CREATE TABLE legal_terms (
    id SERIAL PRIMARY KEY,
    term_zh VARCHAR(100), -- 工資
    term_vi VARCHAR(100), -- tiền lương
    definition_zh TEXT, -- Định nghĩa tiếng Trung
    definition_vi TEXT, -- Định nghĩa tiếng Việt
    examples JSON, -- Ví dụ sử dụng
    category VARCHAR(50), -- salary, working_hours
    difficulty VARCHAR(20), -- beginner, intermediate, advanced
    created_at TIMESTAMP DEFAULT NOW()
);

-- Search Logs
CREATE TABLE search_logs (
    id SERIAL PRIMARY KEY,
    query TEXT,
    results_count INTEGER,
    user_ip VARCHAR(45),
    created_at TIMESTAMP DEFAULT NOW()
);
```

### **Sample Data**
```json
{
  "law_articles": [
    {
      "id": 1,
      "law_type": "勞動基準法",
      "article_number": "第21條",
      "title_zh": "工資給付",
      "content_zh": "工資由勞雇雙方議定之。但不得低於基本工資。",
      "title_vi": "Trả lương",
      "content_vi": "Tiền lương được thỏa thuận giữa người lao động và người sử dụng lao động. Tuy nhiên, không được thấp hơn mức lương cơ bản.",
      "category": "salary",
      "difficulty_level": 2
    }
  ],
  "legal_terms": [
    {
      "id": 1,
      "term_zh": "工資",
      "term_vi": "tiền lương",
      "definition_zh": "勞工因工作而獲得之報酬",
      "definition_vi": "Số tiền mà người lao động nhận được từ người sử dụng lao động",
      "examples": ["基本工資", "加班費", "獎金"],
      "category": "salary",
      "difficulty": "beginner"
    }
  ]
}
```

---

## 🚀 ROADMAP PHÁT TRIỂN

### **Phase 1: MVP - Công cụ tìm kiếm cơ bản (4 tuần)**
```markdown
Tuần 1-2: Backend cơ bản
- [ ] Database setup
- [ ] API tìm kiếm
- [ ] AI dịch thuật cơ bản
- [ ] 50 điều luật quan trọng

Tuần 3-4: Frontend cơ bản
- [ ] Giao diện tìm kiếm
- [ ] Hiển thị kết quả
- [ ] Từ điển thuật ngữ
- [ ] Responsive design
```

### **Phase 2: Nâng cao - Tìm kiếm thông minh (4 tuần)**
```markdown
Tuần 5-6: AI nâng cao
- [ ] Semantic search
- [ ] Legal term recognition
- [ ] Context analysis
- [ ] Related articles

Tuần 7-8: UX/UI cải thiện
- [ ] Search suggestions
- [ ] Quick filters
- [ ] Bookmark system
- [ ] User feedback
```

### **Phase 3: Hoàn thiện - Production ready (4 tuần)**
```markdown
Tuần 9-10: Testing & Optimization
- [ ] Performance testing
- [ ] User testing
- [ ] Bug fixes
- [ ] Security audit

Tuần 11-12: Deployment & Launch
- [ ] Production deployment
- [ ] User documentation
- [ ] Monitoring setup
- [ ] Launch preparation
```

---

## 🎯 ĐIỂM KHÁC BIỆT

### **So với các công cụ hiện tại:**

#### **1. Google Translate:**
- ❌ Không hiểu ngữ cảnh pháp luật
- ❌ Không giải thích thuật ngữ
- ❌ Không có cơ sở dữ liệu luật

#### **2. Từ điển thông thường:**
- ❌ Không có thuật ngữ pháp luật
- ❌ Không có ví dụ sử dụng
- ❌ Không có ngữ cảnh

#### **3. Website luật pháp:**
- ❌ Chỉ có tiếng Trung
- ❌ Khó tìm kiếm
- ❌ Không có giải thích

### **Ưu điểm của hệ thống mới:**
- ✅ **Tìm kiếm thông minh** theo ngữ cảnh
- ✅ **AI dịch thuật** chuyên ngành pháp luật
- ✅ **Từ điển thuật ngữ** tương tác
- ✅ **Giao diện tiếng Việt** dễ sử dụng
- ✅ **Thông tin có tổ chức** theo chủ đề

---

## 📱 DEMO GIAO DIỆN

### **Trang chủ:**
```
┌─────────────────────────────────────────┐
│  🔍 Tra cứu Luật Lao động Đài Loan      │
├─────────────────────────────────────────┤
│  [Tìm kiếm: "lương tối thiểu"    ] [🔍] │
├─────────────────────────────────────────┤
│  📋 Chủ đề thường gặp:                  │
│  [Lương thưởng] [Giờ làm việc]          │
│  [Nghỉ phép] [Tranh chấp]               │
├─────────────────────────────────────────┤
│  📊 Kết quả tìm kiếm:                   │
│  ┌─────────────────────────────────────┐ │
│  │ 勞動基準法 第21條 - 工資給付          │ │
│  │ Tiếng Trung: 工資由勞雇雙方議定之... │ │
│  │ Bản dịch: Tiền lương được thỏa thuận...│ │
│  │ Thuật ngữ: 工資=tiền lương, 基本工資=...│ │
│  └─────────────────────────────────────┘ │
└─────────────────────────────────────────┘
```

---

## 🎯 KẾT LUẬN

Hệ thống này sẽ là một **công cụ tra cứu thông tin pháp luật** chuyên biệt cho người Việt Nam tại Đài Loan, giúp họ:

1. **Tìm kiếm thông tin** pháp luật dễ dàng
2. **Hiểu được luật** thông qua bản dịch AI
3. **Tra cứu thuật ngữ** pháp luật
4. **Tìm hiểu quyền lợi** và nghĩa vụ lao động
5. **Xử lý tranh chấp** lao động

**Đây không phải là khóa học mà là một công cụ hỗ trợ thông tin pháp luật!**

---

**Tác giả:** AI Assistant  
**Ngày tạo:** 2024  
**Phiên bản:** 1.0  
**Trạng thái:** Information Retrieval System
