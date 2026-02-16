# Django Automation

A simple Bash script to automate Django project setup.

This script helps you to  everything is handled interactively in one command.

---

## Requirements

- Linux / macOS
- Python installed
- uv installed
- Git
- VS Code

---

## 1. Clone the Repository

```bash
git clone https://github.com/Dark-Code404/automate-django.git
```

## 2. Navigate into the Folder
```bash
cd automate-django
```

## 3. Make Script Executable
```bash
chmod +x django_automate.sh
```

## 4. Edit the `django_automate.sh` File

Open the `django_automate.sh` file and update the `path` variable to the directory where you want your Django projects to be created.

### Example:

```bash
path="/path/for/project/destination/"
```

## 5. Run the Script with project name
```bash
./django_automate.sh project_name
```