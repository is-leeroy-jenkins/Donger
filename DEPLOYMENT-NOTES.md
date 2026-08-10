# Donger Azure Deployment Files

Copy the contents of this package into the root of the Donger repository. The workflow file must
remain at `.github/workflows/azure-deploy.yml`.

## Required Repository Content

The container build requires these existing Donger items in addition to the generated files:

* `app.py`
* `config.py`
* `grok.py`
* `.streamlit/config.toml`
* `resources/images/dngr-logo.png`
* `resources/images/dngr-avatar.png`
* `resources/images/favicon.ico`
* `boogr.py`, imported by `app.py` and `grok.py`
* `models.py`, imported by `boogr.py`

The attached files should be renamed to their importable production names before committing:

| Attached filename | Repository filename |
| --- | --- |
| `app(20260810-155805).py` | `app.py` |
| `config(20260810-155808).py` | `config.py` |
| `grok(5).py` | `grok.py` |
| `boogr(1).py` | `boogr.py` |
| `models(2).py` | `models.py` |

## GitHub Action Secrets

Create the following repository secrets:

| Secret | Purpose |
| --- | --- |
| `AZURE_CREDENTIALS` | Azure service-principal JSON used by `azure/login` |
| `ACR_NAME` | Registry resource name, such as `2fiddy` |
| `ACR_LOGIN_SERVER` | Registry host, such as `2fiddy.azurecr.io` |
| `ACR_USERNAME` | Registry username |
| `ACR_PASSWORD` | Registry password |

If the repository's default branch is `master`, replace `main` in the workflow trigger before the
first commit.

## Azure Container App Runtime Configuration

Configure external ingress on target port `8501`, and keep the maximum replica count at `1` while
Donger uses SQLite.

Add these Container App environment variables through Azure secret references:

| Environment variable | Required | Purpose |
| --- | --- | --- |
| `XAI_API_KEY` | Yes | xAI inference API authentication |
| `XAI_MANAGEMENT_KEY` | For Collections | xAI management API authentication |
| `XAI_MANAGEMENT_BASE_URL` | When required by the account | xAI management endpoint |

## Persistent Data

`config.py` currently uses `stores/sqlite/Data.db`. To preserve that database without changing the
application source, mount an Azure Files share at:

```text
/app/stores/sqlite
```

Place the initial `Data.db` in that share before relying on existing records. Do not mount a blank
share over `/app`, because doing so hides the application copied into the image.

Logging is already environment-aware. A second Azure Files mount may be placed at
`/app-data/logging`, with these Container App variables:

```text
LOG_DIR=/app-data/logging
LOG_PATH=/app-data/logging/Exceptions.db
LOG_FILE=Exceptions
```

The Hugging Face model cache defaults to `/app-data/huggingface`. It may remain ephemeral, or it may
be backed by Azure Files to prevent repeated downloads after a new container instance starts.

## Dependency Audit Result

* `torch==2.4.1` remains required by `sentence-transformers` and is installed from PyTorch's CPU-only
  wheel index by the Dockerfile.
* `torchvision` is not imported or required by Donger and has been removed.
* `sqlite-vec` is imported by `app.py` but was missing from the prior requirements file; it has been
  added.
* MkDocs, Google Cloud Storage, Office document libraries, ReportLab, and other unused packages were
  removed from the production runtime file.
* `boogr` is not a package dependency. The attached `boogr(1).py` must be committed as `boogr.py`,
  and its attached `models(2).py` dependency must be committed as `models.py`.
