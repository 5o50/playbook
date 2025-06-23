# Gorse

https://github.com/kyegomez/Tiktokx

https://gorse.io/

## Install
https://gorse.io/docs/master/deploy/binary.html#run-gorse-in-one

```
wget -O gorse.zip https://github.com/gorse-io/gorse/releases/latest/download/gorse_linux_amd64.zip
sudo unzip gorse.zip -d /usr/local/bin

```

## 🔥 **2025 Update: LLMs and Foundation Models Revolutionizing Recommendations**

The recommendation system landscape is undergoing a massive transformation in 2025 with the rise of **Large Language Models (LLMs)** and **Foundation Models**. This represents the biggest shift since the introduction of deep learning, moving "beyond keywords" to semantic understanding of user preferences and content.

### **Key 2025 Developments:**

#### **1. LLM-Powered Semantic Understanding**
- **Beyond keyword matching**: LLMs now understand that "a poignant exploration of human connection in a post-apocalyptic world" relates to "survival and emotional resilience" even without shared keywords
- **Rich contextual embeddings**: High-dimensional vectors capture true meaning and relationships between concepts
- **Multi-modal integration**: Systems now process text, images, audio, and video together for richer recommendations

#### **2. Foundation Models for Personalization** 
Netflix and other major platforms have pioneered **foundation models** that:
- Process comprehensive user interaction histories at massive scale
- Use autoregressive next-token prediction objectives (similar to GPT)
- Support multi-token prediction for longer-term user satisfaction
- Enable incremental training for new content and users
- Combine learnable ID embeddings with metadata-based embeddings

#### **3. Solving the Cold Start Problem**
LLMs dramatically improve new user/content recommendations by:
- Leveraging vast pre-trained knowledge from billions of parameters
- Analyzing initial queries or item descriptions to infer preferences
- Providing meaningful starting points without historical interaction data

#### **4. Enhanced Explainability**
Instead of generic explanations like "users who liked this also liked that," LLMs generate detailed, natural language explanations:
> "We recommended this sci-fi adventure because its themes of space exploration and first contact align with your interest in thought-provoking narratives and epic journeys, similar to 'Movie A' which you enjoyed."

#### **5. Conversational Recommender Systems**
- Natural dialogue-driven recommendation experiences
- Users can refine preferences through interactive conversations
- Real-time adaptation based on evolving user intent during sessions

### **2025 Technology Stack Leaders:**

| Technology | Use Case | Leading Examples |
|------------|----------|------------------|
| **Foundation Models** | Large-scale personalization | Netflix's transformer-based approach, Meta's research |
| **LLM Integration** | Semantic understanding | GPT-4o, Gemini 2.0, Claude Opus embeddings |
| **Multimodal AI** | Cross-modal recommendations | OpenAI CLIP, Google Gemini Vision |
| **Agentic AI** | Autonomous recommendation workflows | Microsoft Copilot, OpenAI o3 reasoning |
| **RAG Systems** | Real-time knowledge updates | LangChain, LlamaIndex for recommendation contexts |

---

For building a TikTok-style, real-time, category-focused feed, there are several recommendation engines and frameworks that are more advanced or better suited than Gorse or Tiktokx, especially if you need production-grade scalability, flexibility, and cutting-edge personalization.

## Industry-Leading Alternatives

### 1. **Custom Real-Time Recommendation Systems (Netflix, TikTok, Twitter Style)**
- The most effective systems in production (Netflix, TikTok, Twitter, Spotify) use custom-built, highly optimized real-time recommendation engines. These leverage a mix of collaborative filtering, deep learning, and real-time data processing to deliver hyper-personalized feeds at scale.
- Building such a system requires integrating stream processing (e.g., Apache Flink, Kafka Streams), online feature stores, and deep learning models for embeddings and ranking[1][6].
- While open-source clones are rare, you can architect a similar stack using modular components (see below).

### 2. **Open Source/Framework Options**
- **RecBole**: A powerful open-source recommendation library supporting dozens of state-of-the-art models, including sequential and context-aware recommenders. It's research-focused but can be adapted for production.
- **Microsoft Recommenders**: A comprehensive toolkit from Microsoft with production-ready code for collaborative filtering, content-based, and deep learning recommenders.
- **Metarank**: An open-source real-time personalization and ranking engine, built for modern use cases like feeds and search. It supports feature engineering, online learning, and can integrate with your data pipelines.
- **Vespa**: Yahoo's open-source engine for large-scale, real-time recommendations and search. It supports vector search, ML model serving, and complex ranking logic at scale.

### 3. **Cloud-Based Solutions**
- **Amazon Personalize**: Managed service for real-time recommendations, supporting user-item personalization, similar items, and personalized ranking. Integrates easily with AWS infrastructure.
- **Google Recommendations AI**: Managed service for content and product recommendations, with strong support for context-aware and session-based recommendations.
- These services handle scalability, model updates, and infrastructure, but may be less customizable than open-source/self-hosted solutions.

### 4. **Custom AI-Powered Engines**
- Building your own engine with frameworks like TensorFlow, PyTorch, or Hugging Face Transformers allows for maximum flexibility. You can train multi-modal, deep learning models using your own data and serve them with frameworks like TensorFlow Serving or TorchServe[5][6].
- This approach is resource-intensive but enables you to replicate the sophistication of TikTok's "Monolith" engine or Netflix's recommender stack[1][6].

## Summary Table

| Engine/Framework         | Real-Time | Category Feeds | Personalization | Scalability | Production Ready | LLM Support |
|-------------------------|-----------|----------------|----------------|-------------|------------------|-------------|
| Gorse                   | Yes       | Yes            | Yes            | Good        | Yes              | Limited     |
| Tiktokx                 | No        | No             | Research only  | Limited     | No               | No          |
| RecBole                 | No        | Yes            | Yes            | Limited     | No (research)    | Emerging    |
| Microsoft Recommenders  | No        | Yes            | Yes            | Limited     | No (research)    | Yes         |
| Metarank                | Yes       | Yes            | Yes            | Good        | Yes              | Limited     |
| Vespa                   | Yes       | Yes            | Yes            | Excellent   | Yes              | Yes         |
| Amazon Personalize      | Yes       | Yes            | Yes            | Excellent   | Yes (cloud)      | Yes         |
| Google Recommendations  | Yes       | Yes            | Yes            | Excellent   | Yes (cloud)      | Yes         |
| Custom Deep Learning    | Yes       | Yes            | Yes            | Excellent   | Yes (with effort)| Yes         |
| **LLM-Enhanced Systems** | **Yes**   | **Yes**        | **Excellent**  | **Excellent** | **Yes**        | **Native**  |

## 🎯 **2025 Recommendations**

### **For Startups Building TikTok-Style Feeds:**
1. **Immediate deployment**: Start with Vespa or Metarank + LLM embeddings (OpenAI/Anthropic APIs)
2. **Hybrid approach**: Use traditional collaborative filtering + LLM re-ranking for best results
3. **Foundation model strategy**: Plan for custom foundation model as you scale (Netflix approach)

### **For Enterprises:**
1. **Cloud-first**: Amazon Personalize or Google Recommendations AI with LLM augmentation
2. **Custom development**: Build on Vespa with integrated LLM pipelines for maximum control
3. **Multi-modal**: Integrate text, image, and video understanding for richer recommendations

### **For Maximum Innovation:**
- **Foundation model approach**: Build transformer-based models like Netflix
- **Agentic workflows**: Integrate with autonomous AI agents for dynamic personalization
- **Conversational interfaces**: Enable natural language preference refinement

### **Success Factors for 2025:**
- **Data-centric approach**: Focus on high-quality, diverse training data
- **Incremental learning**: Design for continuous model updates with new content
- **Privacy-first**: Implement federated learning and privacy-preserving techniques
- **Explainable AI**: Provide natural language explanations for user trust
- **Multi-modal capabilities**: Support text, image, audio, and video recommendations

The combination of traditional recommendation techniques with LLM capabilities represents the biggest opportunity in recommendation systems since the advent of deep learning. Companies that successfully integrate these approaches will have significant competitive advantages in user engagement and satisfaction.

---

## Top Open Source Tools for Recommender Systems (as of June 2025)

Several open-source libraries and frameworks have become standards for building, experimenting with, and deploying recommender systems, much like PostgreSQL is for databases. Here are the most notable options, covering both classic and modern approaches:

| Tool/Library                | Language    | Description & Strengths                                                                                 | LLM Integration |
|-----------------------------|-------------|---------------------------------------------------------------------------------------------------------|-----------------|
| **LightFM**                 | Python      | Hybrid (collaborative + content-based), fast, scalable, widely used in production                       | Available       |
| **Surprise**                | Python      | Focused on collaborative filtering, easy experimentation, strong for research and prototyping           | Limited         |
| **RecBole**                 | Python      | Extensive library with 100+ algorithms, supports deep learning and traditional models                   | Yes             |
| **Microsoft Recommenders**  | Python      | Comprehensive examples and utilities for state-of-the-art algorithms, best practices, and scalability   | Strong          |
| **Nvidia Merlin**           | Python/C++  | End-to-end GPU-accelerated ecosystem, supports massive-scale training and modern deep learning models   | Yes             |
| **Gorse**                   | Go          | Scalable, offline recommender backend with RESTful API, easy integration                                | Limited         |
| **Implicit**                | Python      | Fast implementations for implicit feedback datasets, highly efficient for large-scale collaborative filtering | Limited   |
| **LibRecommender**          | Python      | End-to-end recommender system with training and serving modules                                         | Emerging        |
| **tensorrec**               | Python      | Flexible TensorFlow-based recommendation framework                                                      | Yes             |
| **Seldon Core**             | Python      | Model deployment/serving, not recsys-specific but widely used for deploying recommender models          | Yes             |

### **🆕 2025 LLM-Native Frameworks**

| Tool/Library                | Language    | Description & LLM Capabilities                                                                          |
|-----------------------------|-------------|--------------------------------------------------------------------------------------------------------|
| **LangChain**               | Python      | Comprehensive framework for LLM applications, strong RAG support for recommendation contexts           |
| **LlamaIndex**              | Python      | Specialized in data indexing and retrieval for LLM applications, perfect for recommendation RAG        |
| **Haystack**                | Python      | End-to-end framework for LLM-powered applications with strong search and recommendation capabilities   |
| **Vector DBs** (Pinecone, Weaviate, Chroma) | Various | Essential for semantic search and embedding-based recommendations                        |

### Notable Mentions
- **Alibaba EasyRec**: State-of-the-art deep learning models for candidate generation, ranking, and multi-task learning.
- **Spotlight**: Simple, factorization and sequence-based models for quick prototyping.
- **PredictionIO** (Apache): Once popular, now largely abandoned but still referenced in legacy systems.
- **Mahout**: Hadoop-based, focuses on scalable machine learning including recommenders.

### **🚀 Trends in 2025**
- **LLM Integration**: Every major framework now supports or is adding LLM capabilities
- **Foundation Models**: Shift toward large-scale, multi-task recommendation models
- **GPU Acceleration**: Nvidia Merlin leading the charge for massive-scale training[5]
- **Hybrid Architectures**: Combining traditional methods with LLM augmentation
- **Real-time Personalization**: Systems designed for millisecond response times with LLM enhancement
- **Conversational Recommendations**: Natural language interfaces becoming standard
- **Multi-modal Systems**: Integration of text, image, audio, and video understanding

### **💡 Business Impact Considerations**

**Computational Costs**: LLM-powered systems require significant infrastructure investment
- **Hybrid Approach**: Most production systems combine traditional methods with selective LLM usage
- **Edge Computing**: Growing trend toward on-device recommendation models for privacy and speed
- **Cost Optimization**: Focus on efficient model architectures and strategic LLM deployment

### Summary

**LightFM, Surprise, RecBole, Microsoft Recommenders, Nvidia Merlin, and Gorse** remain the core "PostgreSQLs" of recommender systems, but **2025 is the year of LLM integration**. The most successful systems combine these proven foundations with:

1. **LLM-powered semantic understanding** (via LangChain/LlamaIndex)
2. **Foundation model architectures** (Netflix-style approaches)  
3. **Multi-modal capabilities** (text, image, video integration)
4. **Conversational interfaces** (natural language preference refinement)
5. **Real-time personalization** (millisecond response with semantic understanding)

The recommendation is to start with proven frameworks and gradually integrate LLM capabilities based on specific use cases and ROI analysis. The future belongs to systems that seamlessly blend traditional recommendation algorithms with the semantic understanding power of large language models.

## 🏆 **What Makes a Successful Recommendation Company in 2025**

Based on current market trends and startup funding patterns, here are the key success factors:

### **Technical Differentiation**
- **Hybrid LLM Architecture**: Don't go all-in on LLMs or ignore them entirely. The winners combine traditional collaborative filtering with LLM re-ranking
- **Multi-modal Capabilities**: Support text, image, audio, and video recommendations from day one
- **Real-time Personalization**: Sub-100ms response times with semantic understanding
- **Explainable AI**: Natural language explanations build user trust and regulatory compliance

### **Business Model Innovation**
- **Conversational Commerce**: Enable users to refine preferences through natural dialogue
- **Agentic Workflows**: AI agents that proactively suggest content based on context changes
- **Privacy-First Design**: Federated learning and on-device processing for competitive advantage
- **B2B SaaS Focus**: Vertical solutions for specific industries (healthcare, finance, legal) show highest ROI

### **Market Positioning**
- **Start Niche, Go Broad**: Master one vertical before expanding (see: Spotify → music, then podcasts, audiobooks)
- **Data Network Effects**: Each user interaction improves recommendations for everyone
- **Developer-First**: Strong APIs and SDKs accelerate adoption
- **Sustainable Differentiation**: Build proprietary datasets and models that create moats

### **Investment Trends (2025)**
According to recent funding analysis:
- **77% growth** in AI recommendation startups receiving Series A funding
- **Average funding rounds 40% larger** for companies with LLM integration
- **Sustainability focus**: VCs prioritize energy-efficient models and ethical AI practices
- **Profitability over growth**: Focus on unit economics and clear path to profitability

### **Competitive Landscape Insights**
- **Big Tech Advantage**: Google, Meta, Amazon have massive data advantages but struggle with vertical specialization
- **Startup Opportunity**: Specialized, industry-specific solutions with superior user experience
- **European Market**: Strong demand for privacy-compliant, GDPR-native solutions
- **Enterprise Focus**: B2B customers willing to pay premium for specialized, explainable recommendations

### **Future-Proofing Strategy**
1. **Incremental Learning**: Design systems that continuously improve without full retraining
2. **Model Context Protocol**: Implement MCP for standardized AI agent interactions
3. **Edge Computing**: Plan for on-device inference to reduce costs and improve privacy
4. **Regulatory Readiness**: Build transparency and auditability into core architecture

**Bottom Line**: Success in 2025 requires balancing cutting-edge AI capabilities with practical business value, sustainable costs, and user trust. Companies that nail the hybrid LLM approach while maintaining focus on specific use cases and clear ROI will dominate their verticals.

[1] https://recsys.acm.org
[2] https://www.reddit.com/r/recommendersystems/comments/1iwwxpr/state_of_recommender_systems_in_2025_algorithms/
[3] https://recsys.acm.org/recsys25/call/
[4] https://recsys.synerise.com
[5] https://github.com/grahamjenson/list_of_recommender_systems
[6] https://research.aimultiple.com/recommendation-system/
[7] https://beyondrecsys.github.io/2025/
[8] https://eugeneyan.com/writing/recsys-llm/
[9] https://netflixtechblog.medium.com/foundation-model-for-personalized-recommendation-1a0bd8e02d39
[10] https://dev.to/vaib/llms-revolutionize-recommender-systems-beyond-keywords-5g08
[11] https://stripe.com/resources/more/startup-industry-trends-for-2025-what-founders-need-to-know
[12] https://www.ceigateway.com/funding-trends-to-watch-2025/
