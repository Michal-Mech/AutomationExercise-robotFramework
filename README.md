# AutomationEx

UI and API test automation project for [AutomationExercise](https://automationexercise.com), built with Robot Framework and Python.

---

## Running Tests

```bash
# API tests
robot -d Results Tests/AutomationExAPI.robot

# UI tests (requires Chrome)
robot -d Results Tests/AutomationEx.robot

# Run by tag
robot -d Results -i login Tests/AutomationEx.robot
robot -d Results -i products Tests/AutomationExAPI.robot
```

> Open `Results/report.html` in a browser to view the test report.

---

## Built with

| Layer | Technology |
|-------|-----------|
| Test Framework | Robot Framework |
| UI Automation | SeleniumLibrary |
| API Testing | RequestsLibrary |
| Custom Libraries | Python 3 |

---

## Project Structure

```
AutomationEx/
├── Data/
│   ├── InputData.robot          # Test variables (URLs, credentials, form data)
│   └── TestFiles/
│       └── test_upload.txt      # File used in upload test
├── Libraries/
│   └── CustomValidators.py      # Custom Python library (validators + data generators)
├── Resources/
│   ├── Common.robot             # Browser open / close
│   ├── AutomationExApp.robot    # UI keywords
│   ├── AutomationExAPI.robot    # API keywords
│   ├── PO/                      # Page Object files (one per page)
│   └── API/                     # API resource files (Products, Brands, Search)
├── Tests/
│   ├── AutomationEx.robot       # UI test suite
│   └── AutomationExAPI.robot    # API test suite
└── Results/                     # Generated reports (log.html, report.html)
```

---

## Test Coverage

### UI Tests (`Tests/AutomationEx.robot`)

| Test Case | Tag |
|-----------|-----|
| Search for products (logged out) | `search` |
| Add and view product in cart | `cart` |
| Register new user | `register` |
| Login with correct credentials | `login` |
| Login with incorrect credentials | `login_invalid` |
| Logout user | `logout` |
| Register with existing email | `register_existing` |
| Submit Contact Us form | `contact` |
| Verify newsletter subscription | `subscription` |

### API Tests (`Tests/AutomationExAPI.robot`)

| Test Case | Tag |
|-----------|-----|
| GET all products list | `products` |
| POST to products list (405 expected) | `products` |
| GET all brands list | `brands` |
| PUT to brands list (405 expected) | `brands` |
| Search product | `search` |

---

## Custom Python Library

`Libraries/CustomValidators.py` provides custom keywords for both test suites:

**Validators**
- `Validate Email Format` — checks the email format
- `Validate Password Strength` — checks length, uppercase, lowercase, digit, special char
- `Validate Response Has Keys` — asserts required keys exist in API response
- `Validate Products Schema` — validates product list item structure
- `Validate Brands Schema` — validates brand list item structure

**Data Generators**
- `Generate Random Email` — returns a unique `auto_<random>@domain` address
- `Generate Random Password` — returns a password that passes strength validation
- `Generate Random Name` — returns a name with a random numeric suffix
