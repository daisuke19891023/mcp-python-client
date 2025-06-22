"""Test module for alpha_lib example."""

from alpha_lib.example import add


def test_add() -> None:
    """Test the add function."""
    expected_result = 3
    result = add(1, 2)
    assert result == expected_result
