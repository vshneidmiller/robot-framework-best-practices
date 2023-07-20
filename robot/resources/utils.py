def evaluate_password_strength(password: str) -> str:
    length = len(password)
    has_digit = any(char.isdigit() for char in password)
    has_upper = any(char.isupper() for char in password)
    has_lower = any(char.islower() for char in password)
    has_special = any(char in "!@#$%^&*()_+=-{}[]" for char in password)

    score = 0
    score += 1 if has_digit else 0
    score += 1 if has_upper else 0
    score += 1 if has_lower else 0
    score += 1 if has_special else 0

    if length < 8:
        strength = "weak"
    elif 8 <= length < 12:
        if score >= 3:
            strength = "strong"
        elif score >= 2:
            strength = "medium"
        else:
            strength = "weak"
    elif 12 <= length < 16:
        if score >= 4:
            strength = "very_strong"
        elif score >= 3:
            strength = "strong"
        else:
            strength = "medium"
    else:  # length >= 16
        if score >= 4:
            strength = "very_strong"
        elif score >= 3:
            strength = "strong"
        elif score >= 2:
            strength = "medium"
        else:
            strength = "weak"

    # Adjust for the case when there are no special characters
    if not has_special and strength == "strong":
        strength = "medium"

    # Adjust for the case when all characters are lowercase
    if not has_digit and not has_upper and not has_special and strength == "medium":
        strength = "weak"

    # Adjust for the case when all characters are special characters
    if not has_digit and not has_upper and not has_lower and strength == "weak":
        strength = "strong"

    return strength


def compare_lists_with_ignored_indexes(list1, list2, ignored_indexes):
    assert len(list1) == len(list2), f"List lengths are not equal: {len(list1)} != {len(list2)}"

    results = []
    for index, (value1, value2) in enumerate(zip(list1, list2)):
        status = "PASS" if value1 == value2 else f"FAIL: {value1} != {value2}"
        results.append(f"{index} {status}")

    print("\n".join(results))

    for index in range(len(list1)):
        if str(index) in ignored_indexes:
            continue
        assert list1[index] == list2[index], f"Values at index {index} are not equal: {list1[index]} != {list2[index]}"
