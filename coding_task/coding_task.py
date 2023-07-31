__doc__ = """
    Write a program in Python that counts backwards from value provided by user to 1 and prints:
    “Agile” if the number is divisible by 5,
    “Software” if the number is divisible by 3,
    “Testing” if the number is divisible by both, or prints just the number if none of those cases are true.
"""


def get_user_provided_number() -> int:
    """
    I assume that "count backwards" means that the user should provide a number >= 1,
    because if the user provides a number < 1, then we would have to count forward
    """
    user_input: str = input("Type a number >= 1 and hit ENTER: ").strip()
    assert all(char.isdigit() for char in user_input), "You must provide a number"
    user_provided_number = int(user_input)
    assert user_provided_number >= 1, "The number must be >= 1"
    return user_provided_number


def main():
    user_provided_number = get_user_provided_number()

    for number in range(user_provided_number, 0, -1):
        is_divisible_by_5: bool = number % 5 == 0
        is_divisible_by_3: bool = number % 3 == 0

        # Python versions 3.10+ support switch statements (match/case) but I used if/else for backwards compatibility
        if is_divisible_by_5 and is_divisible_by_3:
            print("Testing")
        elif is_divisible_by_5:
            print("Agile")
        elif is_divisible_by_3:
            print("Software")
        else:
            print(number)


if __name__ == "__main__":
    main()
