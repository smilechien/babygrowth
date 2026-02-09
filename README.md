Baby Growth Assessment & Comparison (0–24 Months)

A web-based baby growth assessment system for ages 0–24 months, enabling caregivers and clinicians to compare an individual infant’s growth status against normative references using multiple anthropometric indicators.

This project is implemented in Classic ASP with lightweight JavaScript visualization and is designed for simplicity, clarity, and clinical interpretability.

✨ Features

✅ Supports 0–24 months infants

👦👧 Gender-specific comparison (male / female)

📏 Multiple growth indicators:

Height (cm)

Weight (kg)

Head circumference (cm)

BMI (derived)

📊 Percentile-based comparison against reference norms

🧮 Cohesion (fit-to-norm) index using Euclidean distance

📈 Interactive scatter plots for visual interpretation

⚠️ Built-in alert rules for potential growth concern

💡 Clean, readable summary table (parent-friendly)

🧠 Conceptual Overview

Traditional growth charts often assess one dimension at a time (e.g., height-for-age).
This system introduces a multivariate view of growth, integrating several indicators simultaneously.

Cohesion Index (CC)

Calculated from the Euclidean distance between the child’s measurements and age-/gender-matched norms

Transformed as:

Cohesion = 1 / (1 + a(i) distance within cluster)


Higher value → closer fit to normative growth pattern

🚨 Alert Rule (Reference)

An alert is suggested when both conditions are met:

Cohesion < 0.2

Misfit percentile < 10th percentile

⚠️ This is not a diagnostic tool, but a screening aid to highlight potential deviations that may warrant further evaluation.

🖥 System Architecture
Browser (HTML + Canvas)
   │
   ▼
Classic ASP (VBScript)
   │
   ├─ Input form (age, gender, measurements)
   ├─ Normative data lookup (TXT file)
   ├─ Distance & percentile calculation
   ├─ Summary generation
   └─ Visualization (RGraph scatter plot)

📂 Project Structure
/
├─ sildfeng.asp         # Main application (input + result)
├─ sildfengbk.asp       # Original backup version
├─ sildf.txt            # Normative growth reference data
├─ README.md            # Project documentation
└─ assets/              # (Optional) JS / CSS libraries

▶️ How to Run
Requirements

Windows Server / Local IIS

Classic ASP enabled

No external database required

Steps

Place project folder under IIS root (e.g. wwwroot)

Ensure Classic ASP is enabled in IIS

Confirm sildf.txt is readable (file permission)

Open browser:

http://localhost/sildfeng.asp

📊 Output Summary Example

The summary table reports:

Growth values

Corresponding percentiles

Overall cohesion score

BMI

Alert guidance (if applicable)

Designed to be:

✔ Easy to read

✔ Printable

✔ Interpretable by non-technical users

📌 Use Cases

Pediatric clinics (screening support)

Community health centers

Health informatics demonstrations

Educational / teaching tools

Research prototypes (growth modeling & visualization)

⚠️ Disclaimer

This project is intended for educational and research purposes only.
It does not replace professional medical judgment or official growth standards.

📜 License

MIT License (suggested)
Feel free to adapt, extend, or integrate with attribution.

🙋‍♂️ Author / Contact

Developed for demonstrating:

Applied health informatics

Growth data visualization

Lightweight clinical decision support logic

