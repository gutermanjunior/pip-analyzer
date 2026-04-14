# 📦 pip-analyzer

> 🔍 Python package size analyzer with real-time metrics, smart caching, and CLI support.

---

## 🚀 Overview

`pip-analyzer` is a PowerShell-based tool designed to analyze the size of Python packages installed in your environment (venv or global).

It provides:

- 📊 Real-time progress and performance metrics
- 📦 Package size analysis using `pip-size`
- ⚡ Smart caching based on environment state
- 🧠 Insight into dependency impact
- 🖥️ Dual interface: interactive and CLI

---

## 🆕 Release v1.2.0

Initial release of **pip-analyzer** as a standalone tool.

This version evolves the original script into a reusable and extensible solution, focusing on:

- Developer experience (DX)
- Observability
- Performance awareness

---

## ✨ Features

- 📦 Analyze installed Python packages (`pip list`)
- 📏 Calculate package sizes using `pip-size`
- 📊 Real-time progress with performance metrics:
  - Instant speed (Inst)
  - Average speed (Avg)
  - Moving average (Mov)
- 🧾 Flexible sorting options:
  - Name (alphabetical)
  - Size (descending)
  - Original order (`pip list`)
- 🧠 Smart cache based on environment state (`pip freeze`)
- 🖥️ Dual interface:
  - Interactive mode (guided prompts)
  - CLI mode (automation-friendly)
- 🏆 Top N largest packages (quick impact view)
- 📤 Export results:
  - CSV
  - JSON

---

## 🧠 Smart Cache

The cache system is based on the **state of your Python environment**.

### 🔍 How it works

1. Captures the environment snapshot:

   ```bash
   pip freeze
   ```

2. Generates a hash from this snapshot

3. Uses this hash as a cache key

---

### 🎯 Behavior

| Scenario            | Behavior        |
|--------------------|----------------|
| Same environment   | ⚡ Uses cache  |
| Updated package    | 🔄 Recalculate |
| New environment    | 🔄 New cache   |

---

### 💡 Why this matters

Traditional caching can become inconsistent when dependencies change.

This approach guarantees:
- correctness
- reproducibility
- performance

---

## ▶️ Usage

### Interactive mode

```powershell
.\pip-size.ps1
```

---

### CLI mode

```powershell
.\pip-size.ps1 -Sort Size -Top 10 -UseCache
```

---

### With export

```powershell
.\pip-size.ps1 -Sort Size -Export csv
```

---

## ⚙️ Parameters

| Parameter    | Description |
|-------------|------------|
| `-Sort`     | Name / Size / Original |
| `-Top`      | Top N largest packages |
| `-UseCache` | Enable smart cache |
| `-FastMode` | Skip size calculation (debug mode) |
| `-Export`   | csv / json |

---

## 📊 Example Output

```
Total packages: 57

numpy        1.26.0     12.3 MB
pandas       2.2.1      45.1 MB
requests     2.31.0     1.2 MB
```

---

## 📦 Requirements

- Python 3.x
- pip
- pip-size

Install dependency:

```bash
pip install pip-size
```

---

## ⚠️ Limitations

- Depends on `pip-size` performance (network/cache dependent)
- No dependency deduplication (sizes may overlap)
- Represents package distribution size (wheel), not actual disk usage
- Sequential execution (no parallelism yet)

---

## 🛠️ Tech Details

- PowerShell 7+
- Regex-based parsing (tolerant approach)
- UTF-8 encoding handling
- Real-time terminal rendering (`Write-Progress`)
- Optimized collections (List<T>) to avoid O(n²)
- Environment-based caching strategy

---

## 🧩 Future Improvements

- ⚡ Parallel processing (multi-threaded)
- 📊 Visualization (charts / dashboards)
- 🔍 Dependency tree analysis
- 🧠 Advanced caching strategies
- 🌍 Cross-platform CLI (beyond PowerShell)

---

## 📄 License

MIT

---

## 👨‍💻 Author

Guterman Junior