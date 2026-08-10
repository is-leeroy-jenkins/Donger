###### Donger

![](https://github.com/is-leeroy-jenkins/Donger/blob/main/resources/images/dongr-project.png)

<p align="left">
  <a href="#core-capabilities">Core Capabilities</a>
  &bull;
  <a href="#model-integration">Model Integration</a>
  &bull;
  <a href="#-configuration">Configuration</a>
  &bull;
  <a href="#-installation">Installation</a>
  &bull;
  <a href="#application-features">Features</a>
  &bull;
  <a href="#data-storage--architecture">Architecture</a>
  &bull;
  <a href="#-core-runtime-requirements">Runtime</a>
  &bull;
  <a href="#-license">License</a>
</p>

___

[![Documentation](https://img.shields.io/badge/docs-GitHub%20Pages-0078FC?style=for-the-badge&logo=github)](https://is-leeroy-jenkins.github.io/Donger/)

Donger is a xAI Grok-powered, multimodal application written in Python for data, financial
and policy analysis. It combines conversational ai and structured text
generation, image and audio workflows, document-grounded question answering,
file analysis and Collection management, prompt engineering, and SQLite-based data administration in one
analyst-oriented interface. Food is not included.



## 🎥 Demo

![](https://github.com/is-leeroy-jenkins/Donger/blob/main/resources/images/donger-demo.gif)

## Core Capabilities

| Mode | Description |
| --- | --- |
| 💬 **Chat** | Lightweight conversational interaction with Grok and session-scoped message history |
| 📝 **Text** | Configurable text generation with model, inference, grounding, tool, response-format, and system-instruction controls |
| 🖼 **Images** | Image generation, editing, variation, and multimodal image analysis workflows exposed by the Grok wrapper |
| 🔊 **Audio** | Text-to-speech, transcription, translation, and audio-analysis workflows exposed by the Grok wrapper |
| 📚 **Document Q&A** | Upload, extract, chunk, and query supported documents with source-aware answers |
| 🧬 **Embeddings** | Generate, inspect, download, and persist text embeddings for semantic retrieval |
| 📁 **Files** | Upload, list, inspect, download, and delete xAI-managed files |
| 🗂️ **Collections** | Create and manage xAI Collections, attach documents, search grounded content, and converse against selected Collections |
| 🧩 **Prompt Engineering** | Create, search, edit, version, convert, and delete reusable prompt records |
| 🏛️ **Data Management** | Import, profile, filter, visualize, export, index, alter, and query local SQLite data |

___

## 📦 Architecture
![](https://github.com/is-leeroy-jenkins/Donger/blob/main/resources/images/donger-architecture.png)


## 🧊 Azure

[![Containerized](https://img.shields.io/badge/Docker-App-2496ED?logo=docker&logoColor=white)](https://Donger.thankfulocean-66471d87.eastus.azurecontainerapps.io)

* Containerized application deployment.

## 🔥 Streamlit

[![Streamlit App](https://img.shields.io/badge/Streamlit-App-FF4B4B?logo=streamlit&logoColor=white)](https://budget-Donger-py.streamlit.app/)

* Interactive, wide-layout analytical interface.
* Direct chat and retrieval queries against federal financial-management and defense guidance.
* Session-based controls for Grok credentials, models, prompts, files, and analytical results.

![](https://github.com/is-leeroy-jenkins/Donger/blob/main/resources/Donger-chat.gif)

## 🧱 Databricks

[![Donger](https://img.shields.io/badge/Databricks-Donger-FF3621?logo=databricks&logoColor=white)](https://dbc-a0c21f80-7bb3.cloud.databricks.com/browse/folders/3169291152438532?o=7474645703081351)

* Collaborative data-engineering, analytics, and artificial-intelligence workspace.
* Supports knowledge-base customization, computer-vision workflows, and text embeddings.

![](https://github.com/is-leeroy-jenkins/Donger/blob/main/resources/Donger-demo.gif)

## Model Integration

### xAI Grok

Donger routes provider-backed functionality through the local `grok` class. The interface
discovers wrapper capabilities at runtime and exposes only modes backed by an available Grok
class. The configured model families include Grok reasoning/text models and Grok image-generation
and image-editing models.

Depending on the selected model and wrapper capability, Donger supports:

* Multi-turn chat and text generation.
* Configurable temperature, top-p, penalties, token limits, stop sequences, storage, streaming,
  and reasoning controls.
* Web search and xAI Collections search for grounded responses.
* Plain text, JSON object, and JSON Schema response formats.
* Image generation, image editing, and multimodal analysis.
* Audio generation and speech-processing workflows.
* File lifecycle and Collection document management.

### Domain Knowledge Collections

Donger is configured to work with xAI Collections covering federal financial regulations, public
laws, explanatory statements, governance material, DoD data and regulations, Army field manuals,
Army techniques publications, and Army style guides. Collection identifiers remain configuration
data and should be replaced with identifiers available to the deployed xAI account.

### Hugging Face Datasets

[![HuggingFace](https://huggingface.co/datasets/huggingface/badges/resolve/main/model-on-hf-sm.svg)](https://huggingface.co/leeroy-jankins/datasets)

The project references curated datasets covering federal budget execution, appropriations and
fiscal law, accounting and audit standards, and DoD policy documentation. These repositories are
knowledge sources for retrieval and evaluation; this application does not load a Hugging Face
fine-tuned model directly in the current source.

## 🔑 Configuration

Obtain xAI credentials using the project’s [Grok API setup instructions](https://github.com/is-leeroy-jenkins/Donger/blob/main/resources/setup/xai.md),
then configure the environment as described in the [environment setup guide](https://github.com/is-leeroy-jenkins/Donger/blob/main/resources/setup/environments.md).

| Variable                  | Required                 | Purpose                                                                     |
|---------------------------|--------------------------|-----------------------------------------------------------------------------|
| `XAI_API_KEY`             | Yes                      | Grok inference, generation, embeddings, and standard file operations        |
| `XAI_MANAGEMENT_KEY`      | For management workflows | xAI Collection and management-plane operations when required by the wrapper |
| `XAI_MANAGEMENT_BASE_URL` | Optional                 | Overrides the configured xAI management endpoint                            |
| `LOG_DIR`                 | Optional                 | Overrides the local exception-log directory                                 |
| `LOG_PATH`                | Optional                 | Overrides the SQLite exception-log path                                     |
| `LOG_FILE`                | Optional                 | Overrides the exception-log table or logical file name                      |

The standard xAI API base URL is configured as `https://api.x.ai/v1`. API keys may also be entered
at runtime through the Streamlit sidebar. Treat credentials as secrets and do not commit them to
source control.

## 📦 Installation

```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
python -m pip install -r requirements.txt
streamlit run app.py
```

For Command Prompt, activate the environment with `.venv\Scripts\activate.bat`. On Linux or macOS,
use `source .venv/bin/activate`.

The repository must also contain the project-local `grok` wrapper and `boogr` package imported by
`app.py`, together with the configured `resources/`, `stores/`, and `logging/` directories.

## Application Features

### 1. Chat and Text Generation

* Chat mode provides a focused Grok conversation with retained session messages.
* Text mode provides detailed model, inference, grounding, response, and instruction controls.
* Prompt templates can be filtered by category and loaded into the active instruction editor.
* Responses can include extracted text, sources, structured content, and downloadable artifacts.

### 2. Grounding and Source Attribution

* Web search can be constrained by allowed domains.
* Collections search grounds responses in selected xAI knowledge collections.
* Response parsing extracts source titles, URLs, snippets, file citations, and Collection metadata
  when returned by the provider.
* Source-aware output supports review and auditability; it does not replace source validation.

### 3. Images and Audio

* Image workflows support provider-advertised generation, editing, variation, and analysis options.
* Uploaded images can be supplied to multimodal Grok models with configurable detail levels.
* Audio workflows support provider-advertised speech synthesis, transcription, translation, and
  analysis operations.
* Generated or transformed media can be previewed and downloaded from the application.

### 4. Document Q&A

* Accepts PDF, text, Markdown, Word, JSON, CSV, and Excel documents.
* Extracts text, applies configurable cleaning, and segments content by sentences with a token-window
  fallback.
* Builds local semantic context with sentence-transformer embeddings and similarity ranking.
* Sends selected context and the user’s question to Grok for a grounded answer.
* Maintains separate instructions, document state, messages, answers, and source output.

### 5. Embeddings

* Accepts direct text, uploaded content, processed text, or chunked input.
* Generates embeddings through the Grok embeddings wrapper when available.
* Displays vector dimensions, record counts, previews, and output tables.
* Supports CSV export and local SQLite persistence for downstream semantic search.

### 6. Files and Collections

* Files mode manages xAI-hosted assets through upload, list, retrieve, content, download, and delete
  operations exposed by the wrapper.
* Collections mode creates, lists, selects, updates, and deletes Collections.
* Documents can be uploaded and attached to a Collection, listed, inspected, and removed.
* Selected Collections can ground an interactive conversation through Collections Search.

### 7. Prompt Engineering

* Stores prompt name, category, content, version, variables, description, and timestamps in SQLite.
* Provides search, sorting, pagination, record selection, and an authoritative editor.
* Supports create, update, delete, clear, load, and XML/Markdown instruction conversion workflows.

### 8. Data Management

* Uses a local SQLite database at `stores/sqlite/Data.db` by default.
* Imports structured data, profiles tables, filters rows, aggregates values, and renders Plotly
  visualizations.
* Exports query and table results and supports index, table, column, and schema administration.
* Provides a guarded SQL console that blocks multiple statements and destructive keywords.

## Data Storage & Architecture

| Layer                     | Responsibility                                                                                        |
|---------------------------|-------------------------------------------------------------------------------------------------------|
| Streamlit UI              | Mode selection, session state, controls, previews, tables, charts, and downloads                      |
| Grok wrapper              | xAI text, image, audio, embeddings, files, and Collections API contracts                              |
| Local processing          | Document extraction, cleaning, chunking, tokenization, similarity scoring, and response normalization |
| SQLite                    | Prompt records, imported analytical data, embeddings, metadata, and exception logging                 |
| xAI Files and Collections | Provider-hosted document lifecycle and managed retrieval resources                                    |
| Resources                 | Application images, avatars, favicon, and supporting static assets                                    |

Local prompt and data records persist in SQLite. Streamlit interaction state is session-scoped.
xAI-hosted files and Collections persist according to the xAI account and API lifecycle.

## Intended Users

* Federal budget and financial-management analysts.
* DoD and civilian-agency policy professionals.
* Program, portfolio, audit, and compliance analysts.
* Data scientists supporting formulation, execution, reporting, and semantic retrieval.
* Managers requiring traceable analytical assistance across authoritative guidance.

## Federal Budget Guidance

- Financial guidance common across federal agencies.

- [![HuggingFace](https://huggingface.co/datasets/huggingface/badges/resolve/main/model-on-hf-sm.svg)](https://huggingface.co/leeroy-jankins/datasets)

| File Name                                                                                                                                                                 | Description                                                                                                            |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| [Balanced Budget and Emergency Deficit Control Act of 1985](https://huggingface.co/datasets/leeroy-jankins/The-Balanced-Budget-And-Emergency-Deficit-Control-Act-of-1985) | Establishes statutory limits on federal spending and deficit control mechanisms, including sequestration procedures.   |
| [Budget Control Act of 2011](https://huggingface.co/datasets/leeroy-jankins/The-Budget-Control-Act-2011)                                                                  | Sets discretionary spending caps and establishes enforcement mechanisms to control federal deficits.                   |
| [Digital Accountability And Transparency Act of 2014](https://huggingface.co/datasets/leeroy-jankins/Data-Act-2014)                                                       | Requires standardized federal spending data and improved transparency through government-wide financial reporting.     |
| [Federal Account Symbols And Titles Book](https://huggingface.co/datasets/leeroy-jankins/FastBook)                                                                        | Defines Treasury account symbols and official titles used for federal budgetary and accounting purposes.               |
| [Federal Acquisition Regulation](https://huggingface.co/datasets/leeroy-jankins/Federal-Acquisition-Regulation)                                                           | Establishes uniform policies and procedures governing the acquisition of goods and services by federal agencies.       |
| [Federal Government Standards For Internal Controls](https://huggingface.co/datasets/leeroy-jankins/Federal-Government-Standards-For-Internal-Controls)                   | Defines the internal control framework for federal agencies to ensure accountability, integrity, and compliance.       |
| [Federal Managers Financial Integrity Act of 1982](https://huggingface.co/datasets/leeroy-jankins/FMFIA-1982)                                                             | Requires agencies to establish internal controls and report annually on their effectiveness.                           |
| [Federal Trust Fund Accounting Guide](https://huggingface.co/datasets/leeroy-jankins/Federal-Trust-Fund-Accounting-Guide)                                                 | Provides accounting guidance for the management and reporting of federal trust funds.                                  |
| [Financial Management Regulations DOD 7000-14-R](https://huggingface.co/datasets/leeroy-jankins/DOD-7000-14-Financial-Management-Regulation)                                                                                                                        | Establishes DoD-specific financial management policies, procedures, and accounting requirements.                       |
| [Fiscal Responsibility Act](https://huggingface.co/datasets/leeroy-jankins/The-Fiscal-Responsibility-Act-of-2023)                                                                                                                                                 | Establishes statutory measures intended to improve fiscal discipline and control federal spending.                     |
| [Government Auditing Standards](https://huggingface.co/datasets/leeroy-jankins/Government-Auditing-Standards)                                                                                                                                             | Sets professional standards for audits of government organizations, programs, activities, and functions.               |
| [Government Invoicing User Guide](https://huggingface.co/datasets/leeroy-jankins/Government-Performance-and-Results-Act)                                                                                                                                           | Provides guidance on federal invoicing standards and processes for government transactions.                            |
| [Government Performance and Results Act of 1993](https://huggingface.co/datasets/leeroy-jankins/Government-Performance-and-Results-Act)                                                                                                                            | Requires agencies to engage in strategic planning and performance measurement to improve program effectiveness.        |
| [GPRA Modernization Act of 2010](https://huggingface.co/datasets/leeroy-jankins/The-GPRA-Modernization-Act-Of-2010)                                                                                                                                            | Updates GPRA by strengthening performance management, cross-agency goals, and accountability.                          |
| [OMB Circular A-11 Preparation Submission And Execution Of The Budget](https://huggingface.co/datasets/leeroy-jankins/OMB-Circular-A-11)                                                                                                      | Provides comprehensive guidance for preparing, submitting, and executing the President’s Budget.                       |
| [OMB Circular A-11 Section 120 Apportionment Process](https://huggingface.co/datasets/leeroy-jankins/OMB-Circular-A11-Section-120-Apportionment-Process)                                                                                                                       | Defines the apportionment process used to control the rate of obligation of budgetary resources.                       |
| [OMB Circular A-123 Managements Responsibility for Enterprise Risk Management and Internal Control](https://huggingface.co/datasets/leeroy-jankins/OMB-Circular-A-123)                                                                         | Defines management responsibilities for internal control and enterprise risk management across federal agencies.       |
| [Federal Trust Fund Accounting Guide](https://huggingface.co/datasets/leeroy-jankins/Federal-Trust-Fund-Accounting-Guide)                                                                                                                       | Establishes requirements for federal agency financial statements and reporting.                                        |
| [Principles Of Federal Appropriations Law Volume One](https://huggingface.co/datasets/leeroy-jankins/Principles-Of-Federal-Appropriations-Law)                                                                                                                       | Authoritative GAO guidance on foundational principles governing the use of federal appropriations.                     |
| [Statements of Federal Federal Financial Accounting Concepts and Standards](https://huggingface.co/datasets/leeroy-jankins/Statements-Of-Federal-Financial-Accounting-Concepts-And-Standards)                                                                                                 | Establishes accounting concepts and standards for federal financial reporting.                                         |
| [The Anti-Deficiency Act PL 97-258](https://huggingface.co/datasets/leeroy-jankins/The-Anti-Deficiency-Act)                                                                                                                                         | Prohibits federal agencies from obligating or expending funds in excess of appropriations or before enactment.         |
| [The Anti-Deficiency Reform and Enforcement Act of 2018](https://huggingface.co/datasets/leeroy-jankins/The-Anti-Deficiency-Reform-And-Enforcement-Act-Of-2018)                                                                                                                    | Strengthens Anti-Deficiency Act enforcement and reporting requirements to improve fiscal accountability.               |
| [The Chief Financial Officers Act of 1990](https://huggingface.co/datasets/leeroy-jankins/The-Chief-Financial-Officers-Act-1990)                                                                                                                                  | Establishes agency Chief Financial Officers and modernizes federal financial management practices.                     |
| [The Congressional Budget and Impoundment Control Act of 1974](https://huggingface.co/datasets/leeroy-jankins/The-Congressional-Budget-And-Impoundment-Control-Act-Of-1974)                                                                                                              | Establishes the congressional budget process and restricts executive impoundment of appropriated funds.                |
| [Statutory Pay As You Go Act of 2010](https://huggingface.co/datasets/leeroy-jankins/Statutory-Pay-As-You-Go-Act-of-2010)                                                                                                                                                   | Authorizes interagency agreements for the provision of goods and services on a reimbursable basis.                     |
| [The Stafford Act](https://huggingface.co/datasets/leeroy-jankins/The-Stafford-Act)                                                                                                                                                          | Provides the statutory framework for federal disaster response and emergency assistance.                               |
| [Federal Trust Fund Accounting Guide](https://huggingface.co/datasets/leeroy-jankins/Federal-Trust-Fund-Accounting-Guide)                                                                                                                                  | Provides additional appropriations authority beyond regular annual funding acts.                                       |
| [Title 2 Code of Federal Regulations – Uniform Administrative Requirements, Cost Principles, and Audit](https://huggingface.co/datasets/leeroy-jankins/Title-2-CFR-Uniform-Administrative-Requirements-Cost-Principles-And-Audit)                                                                     | Establishes uniform administrative, cost, and audit requirements for federal financial assistance.                     |
| [Title 31 Code of Federal Regulations – Money and Finance](https://huggingface.co/datasets/leeroy-jankins/Title-31-CFR-Money-and-Finance)                                                                                                                  | Codifies Treasury and federal financial management regulations governing money and finance.                            |
| [US Standard General Ledger Account Definitions](https://huggingface.co/datasets/leeroy-jankins/US-Standard-General-Ledger-Accounts-And-Definitions)                                                                                                                            | Defines standardized account structures used for federal accounting and financial reporting.                           |

## Department of War Guidance

- Support for DoD-specific budget formulation, execution, audit, and compliance analysis.\

- [![HuggingFace](https://huggingface.co/datasets/huggingface/badges/resolve/main/model-on-hf-sm.svg)](https://huggingface.co/leeroy-jankins/datasets)

| File Name                                                          | Description                                                                                                                     |
|--------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| Access Management For DOD Information Systems DOD 8520-04          | Establishes Department of Defense policy for identity, credential, and access management (ICAM) across DoD information systems. |
| Acquisition Management Of Contractor-Prepared Data DOD 5010-12     | Defines requirements for managing, retaining, and accessing data produced by contractors during DoD acquisitions.               |
| Acquisition Transformation Strategy                                | Outlines DoD-wide strategic objectives for modernizing acquisition processes, governance, and workforce practices.              |
| Administrative Instruction DODAM 28                                | Provides administrative procedures and internal management guidance under the DoD Administrative Management framework.          |
| Audit Manual DOD 7600-07                                           | Establishes audit policies, responsibilities, and procedures for DoD financial and performance audits.                          |
| Civilian Personnel Management System Payroll DOD 1400-25-v550      | Governs payroll administration within the DoD Civilian Personnel Management System (CPMS).                                      |
| Civilian Personnel Management System Performance DOD 1400-25-v430  | Defines performance management policies for DoD civilian employees, including evaluation and appraisal standards.               |
| Cybersecurity Reciprocity Playbook DOD 2024-01-02                  | Provides guidance for reciprocal acceptance of cybersecurity authorizations across DoD components to reduce duplication.        |
| DevSecOps Fundamentals v2.5                                        | Introduces core principles, practices, and terminology for implementing DevSecOps in DoD environments.                          |
| DevSecOps OSS Development                                          | Addresses the development and use of open-source software within DoD DevSecOps pipelines.                                       |
| DevSecOps Playbook DODCIO 2021-10-19                               | Official DoD CIO guidance for planning, implementing, and scaling DevSecOps capabilities.                                       |
| DevSecOps Reference Design AWS Managed Services DODCIO 2021-10-19  | Provides a reference architecture for deploying DevSecOps using AWS managed services in DoD contexts.                           |
| DNS IP Address Use And Approval DOD 8410                           | Establishes policy for allocation, registration, and approval of DNS names and IP address usage within DoD networks.            |
| DOD Cloud Reference Design Cloud GitHub Azure                      | Reference architecture describing DoD-approved cloud implementation patterns using Microsoft Azure.                             |
| DOD AI Strategy                                                    | Defines DoD objectives, priorities, and governance principles for artificial intelligence adoption.                             |
| Emergency Management Program DOD 6055-17                           | Establishes policy for preparedness, response, recovery, and mitigation of emergencies affecting DoD operations.                |
| Forms Management Program DOD 7750-08                               | Governs the lifecycle management of DoD forms, including standardization and control.                                           |
| Information Network Transport DOD 8010-01                          | Provides policy for managing DoD network transport infrastructure and communications pathways.                                  |
| Information Technology Standards DOD 8310-01                       | Establishes requirements for adopting and enforcing IT standards across the Department of Defense.                              |
| Infosec Program and Securing SCI DOD 5200-01p                      | Governs information security programs, including the protection of Sensitive Compartmented Information (SCI).                   |
| Management Of DOD IE DOD 8000-01                                   | Establishes governance for managing the DoD Information Enterprise (IE).                                                        |
| Multifactor Authentication DOD Networks                            | Defines requirements for implementing MFA across DoD network environments to strengthen access security.                        |
| National Defense Strategy 2026                                     | Sets strategic defense priorities, threats, and force-planning guidance for the Department of Defense.                          |
| Online Information Management And Electronic Messaging DOD 8170-01 | Establishes policy for managing official DoD online content and electronic communications.                                      |
| OPSEC Manual DOD 5205-02                                           | Provides policy and procedures for Operations Security to protect critical information from adversaries.                        |
| Personnel Identity Protection Program DOD 1000-25                  | Establishes policies for identity protection and credentialing of DoD personnel.                                                |
| PPBE Reform Activities FY2026                                      | Describes planned reforms to the Planning, Programming, Budgeting, and Execution (PPBE) process for FY2026.                     |
| Records Management Standards DTM 22-001                            | Establishes mandatory standards for managing, retaining, and disposing of DoD records.                                          |
| Use Of Non-Government Owned Mobile Devices.                        | Provides policy governing the use of personally owned mobile devices for official DoD activities.                               |

## File A (Account Balances)

- [File A](https://www.usaspending.gov/download_center/custom_account_data) is part of the package
  of data submitted
  to [USAspending.gov](https://www.usaspending.gov/download_center/custom_account_data) every month
  by federal agencies, as required by the DATA Act. As part of the monthly submission process,
  agencies
  generate File A automatically from data in the [Governmentwide Treasury Account Symbol Adjusted
  Trial Balance System (GTAS)](https://fiscal.treasury.gov/gtas/), or choose to upload their own
  custom File A data.

- File A contains budgetary resources, obligation, and outlay data for all the relevant Treasury
  Account Symbols (TAS) in a reporting agency, with additional breakdown by Budget Function. It
  includes both award and
  non-award spending (grouped together), and crosswalks with the SF 133 report.

## SF 133

- The [SF 133 Report on Budget Execution and Budgetary Resources](https://portal.max.gov/portal/document/SF133/Budget/FACTS%20II%20-%20SF%20133%20Report%20on%20Budget%20Execution%20and%20Budgetary%20Resources.html)
fulfills the requirement in 31
U.S.C. 1511 - 1514 that the President review Federal expenditures at least four times a year.

- SF 133s provide historical reference that can be used to help prepare the President's Budget,
  program operating plans, and spend-out rate estimates.

- Agencies submit the data that appear on these reports to the Department of the Treasury Bureau of
  Fiscal Service. While OMB publishes these reports as a service to agency budget and finance
  offices
  and other interested parties, the underlying data is submitted by the agencies.

## 🖥 Core Runtime Requirements

| Category                     | Component / Library           | Required          | Purpose / Notes                                                     |
|------------------------------|-------------------------------|-------------------|---------------------------------------------------------------------|
| **Core Runtime**             | Python                        | Yes               | Application runtime; Python 3.11 is recommended                     |
|                              | Streamlit                     | Yes               | Interactive web interface and session state                         |
|                              | pip and `venv`                | Yes               | Dependency installation and environment isolation                   |
| **Provider Integration**     | Project-local `grok` wrapper  | Yes               | xAI inference, media, embeddings, files, and Collections operations |
|                              | Project-local `boogr` package | Yes               | Structured errors and SQLite exception logging                      |
| **Data and Analytics**       | pandas                        | Yes               | Tables, import/export, profiling, and transformations               |
|                              | NumPy                         | Yes               | Vector and numerical operations                                     |
|                              | Plotly                        | Yes               | Interactive analytical visualizations                               |
|                              | SQLite                        | Built in          | Prompt, data, embedding, metadata, and log persistence              |
|                              | `sqlite-vec`                  | Feature-dependent | SQLite vector extension used by local vector operations             |
| **Documents and Embeddings** | PyMuPDF (`fitz`)              | Feature-dependent | PDF extraction and rendering                                        |
|                              | sentence-transformers         | Yes               | Local document and query embeddings                                 |
|                              | tiktoken                      | Yes               | Token counting and chunk sizing                                     |
|                              | openpyxl                      | Feature-dependent | Excel import and export through pandas                              |
| **Media**                    | Pillow and audio codecs       | Feature-dependent | Image handling and browser-compatible audio processing              |

Install the exact versions pinned by the repository’s `requirements.txt`. Provider model names and
capabilities can change independently of Donger; use models returned by the installed Grok wrapper
and enabled for the configured xAI account.

## Project Structure

```text
Donger/
├── app.py                  # Streamlit application and mode implementations
├── config.py               # Application constants, models, modes, paths, and help text
├── models.py               # Shared application data/configuration models
├── grok.py                 # Project-local xAI wrapper
├── requirements.txt        # Python dependencies
├── .streamlit/
│   └── config.toml         # Streamlit theme and runtime configuration
├── resources/              # Branding, images, avatars, setup guidance, and static assets
├── stores/
│   └── sqlite/
│       └── Data.db         # Default local application database
└── logging/                # Local exception-log storage
```

The actual repository may contain additional modules and documentation. Preserve the relative
paths configured in `config.py` when relocating application assets.

## Operational Considerations

* Validate model-generated conclusions against authoritative laws, regulations, policy documents,
  source systems, and responsible officials.
* Review retrieved citations and Collection results before relying on them in an official product.
* Do not upload classified, controlled, privileged, procurement-sensitive, personally identifiable,
  or otherwise restricted information unless the deployed environment and xAI account are formally
  authorized for that data.
* Protect API and management keys through environment variables or an approved secret store.
* Back up `stores/sqlite/Data.db` before schema changes or destructive administrative operations.
* Treat the built-in SQL safeguards as a user-interface control, not as a substitute for database
  permissions, backups, or deployment security.

## Disclaimer

Donger is an analytical support tool and is not an authoritative source of federal law, policy,
accounting treatment, budget authority, or legal advice. Outputs generated by large language models
and retrieved content should be independently reviewed and validated by qualified personnel before
use in official decisions, submissions, reports, or policy actions.

## 📝 License

Donger is distributed under the [MIT License](https://github.com/is-leeroy-jenkins/Donger/blob/main/LICENSE).
