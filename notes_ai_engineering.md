# AI Engineering Notes

## Beginner

- AI engineering builds applications that use machine learning and language models.
- Prompt engineering is the practice of designing prompts for LLMs.
- Key AI concepts:
  - accuracy, relevance, and safety
  - training data and inference
  - retrieval-augmented generation (RAG)

## Intermediate

- LLM fundamentals:
  - an LLM is trained to predict the next token in text
  - models can be tuned with fine-tuning or adapters
  - context windows determine how much text the model can process
- RAG:
  - use embeddings and vector stores to look up documents
  - combine retrieval results with LLM generation
  - improve factuality and domain relevance
- MCP and AI Agents:
  - Model Context Protocol (MCP) connects tools, data, and models
  - AI agents can use tools, perform actions, and manage workflows
- LangChain and LangGraph:
  - LangChain is a framework for building LLM applications
  - LangGraph is a graph-based interface for model pipelines

## Advanced

- Vector databases:
  - store embeddings for similarity search
  - popular tools include Pinecone, Milvus, and FAISS
  - use semantic search for knowledge retrieval
- Agent architectures:
  - tool use, planning, and decision-making
  - execute tasks by combining multiple model calls and APIs
- Productionizing AI systems:
  - version data, prompts, and model configurations
  - monitor performance, drift, and cost
- Responsible AI:
  - handle bias, privacy, and security
  - validate model outputs and set guardrails

## Practical guidance

- Start with clear goals for what the AI should do.
- Keep prompts concise and include relevant context.
- Test edge cases and unexpected input.
- Use retrieval when the model needs access to external knowledge.
