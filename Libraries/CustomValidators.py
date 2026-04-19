import re
import random
import string

from robot.api.deco import keyword, library


@library
class CustomValidators:
    """Custom Python library for Robot Framework.

    Provides reusable validation and test-data generation utilities
    that complement the built-in Robot Framework keywords.
    """

    ROBOT_LIBRARY_SCOPE = "GLOBAL"

    # Email and password validation
    @keyword
    def validate_email_format(self, email: str) -> None:
        """Validates that *email* matches a standard email pattern.

        Raises ``AssertionError`` if the format is invalid.

        Example:
        | Validate Email Format | user@example.com |
        """
        pattern = r"^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$"
        if not re.match(pattern, email):
            raise AssertionError(f"Invalid email format: '{email}'")

    @keyword
    def validate_password_strength(self, password: str, min_length: int = 8) -> None:
        """Validates password strength against common security rules.

        Checks: minimum length, uppercase letter, lowercase letter,
        digit and special character.

        Example:
        | Validate Password Strength | MyPass@99 |
        | Validate Password Strength | MyPass@99 | min_length=10 |
        """
        errors = []
        if len(password) < int(min_length):
            errors.append(f"at least {min_length} characters (got {len(password)})")
        if not re.search(r"[A-Z]", password):
            errors.append("at least one uppercase letter")
        if not re.search(r"[a-z]", password):
            errors.append("at least one lowercase letter")
        if not re.search(r"\d", password):
            errors.append("at least one digit")
        if not re.search(r'[!@#$%^&*()\-_=+\[\]{};:\'",.<>?/\\|`~]', password):
            errors.append("at least one special character")
        if errors:
            raise AssertionError(f"Password too weak — missing: {', '.join(errors)}")

    @keyword
    def validate_response_has_keys(self, response_json: dict, *expected_keys: str) -> None:
        """Validates that *response_json* contains all *expected_keys*.

        Example:
        | ${data}= | Set Variable | ${response.json()} |
        | Validate Response Has Keys | ${data} | responseCode | products |
        """
        missing = [k for k in expected_keys if k not in response_json]
        if missing:
            raise AssertionError(
                f"Response is missing expected key(s): {missing}. "
                f"Actual keys: {list(response_json.keys())}"
            )

    @keyword
    def validate_products_schema(self, products_list: list) -> None:
        """Validates that every item in *products_list* contains required product fields.

        Required fields: ``id``, ``name``, ``price``, ``brand``, ``category``.

        Example:
        | Validate Products Schema | ${response.json()['products']} |
        """
        required_fields = ["id", "name", "price", "brand", "category"]
        for index, product in enumerate(products_list):
            missing = [f for f in required_fields if f not in product]
            if missing:
                raise AssertionError(
                    f"Product at index {index} is missing field(s): {missing}. "
                    f"Product data: {product}"
                )

    @keyword
    def validate_brands_schema(self, brands_list: list) -> None:
        """Validates that every item in *brands_list* contains required brand fields.

        Required fields: ``id``, ``brand``.

        Example:
        | Validate Brands Schema | ${response.json()['brands']} |
        """
        required_fields = ["id", "brand"]
        for index, brand in enumerate(brands_list):
            missing = [f for f in required_fields if f not in brand]
            if missing:
                raise AssertionError(
                    f"Brand at index {index} is missing field(s): {missing}. "
                    f"Brand data: {brand}"
                )

    @keyword
    def generate_random_email(self, domain: str = "test.com") -> str:
        """Returns a randomly generated email address.

        Example:
        | ${email}= | Generate Random Email |
        | ${email}= | Generate Random Email | domain=example.org |
        """
        username = "".join(random.choices(string.ascii_lowercase + string.digits, k=8))
        return f"auto_{username}@{domain}"

    @keyword
    def generate_random_password(self, length: int = 10) -> str:
        """Returns a random password that satisfies ``Validate Password Strength``.

        Example:
        | ${pwd}= | Generate Random Password |
        | ${pwd}= | Generate Random Password | length=12 |
        """
        length = int(length)
        upper = random.choice(string.ascii_uppercase)
        lower = "".join(random.choices(string.ascii_lowercase, k=max(length - 4, 2)))
        digit = random.choice(string.digits)
        special = random.choice("!@#$%^&*")
        pool = upper + lower + digit + special
        return "".join(random.sample(pool, len(pool)))

    @keyword
    def generate_random_name(self, prefix: str = "User") -> str:
        """Returns a random display name with a numeric suffix.

        Example:
        | ${name}= | Generate Random Name |
        | ${name}= | Generate Random Name | prefix=Tester |
        """
        suffix = "".join(random.choices(string.digits, k=4))
        return f"{prefix}{suffix}"
