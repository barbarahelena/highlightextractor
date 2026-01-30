# PDF Highlight Extractor

Extract highlighted text from PDF files and save to markdown, plain text, or Word documents.

## Installation

Run the install script:

```bash
./install.sh
source ~/.zshrc  # or ~/.bashrc
```

The install script will:
1. Install Python dependencies (PyMuPDF, python-docx)
2. Add a `highlights` alias to your shell config (~/.zshrc or ~/.bashrc)

After installation, you can run `highlights` from any directory.

### Manual installation

```bash
pip3 install PyMuPDF python-docx
```

Then run directly with:
```bash
python3 /path/to/highlight_extractor.py document.pdf
```

## Usage

```bash
# Extract to markdown (default)
highlights document.pdf

# Extract to plain text
highlights document.pdf -f txt

# Extract to Word document
highlights document.pdf -f docx

# Specify output filename
highlights document.pdf -f md -o my_notes.md
```

## Options

| Option | Description |
|--------|-------------|
| `-f`, `--format` | Output format: `md`, `txt`, or `docx` (default: `md`) |
| `-o`, `--output` | Output file path (auto-generated if not specified) |

## Output

Highlights are grouped by page number:

```markdown
# Highlights from document.pdf

## Page 5

> First highlighted passage from page 5.

> Second highlighted passage from page 5.

## Page 12

> Highlighted text from page 12.
```

## Requirements

- Python 3.9+
- PyMuPDF
- python-docx (for Word output)
