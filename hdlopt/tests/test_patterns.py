import pytest
from ..patterns.substring import SubstringPattern, Substring_CountPattern
from ..patterns.string_match import StringMatchPattern
from ..patterns.regex import RegexPattern


def test_substring_pattern():
    # Test SubstringPattern
    pattern = SubstringPattern("alu")
    assert pattern.matches("alu.v") == True, "Substring 'alu' should match 'alu.v'"
    assert (
        pattern.matches("adder.v") == False
    ), "Substring 'alu' should not match 'adder.v'"
    assert (
        pattern.exact_match("alu.v") == True
    ), "Exact match for 'alu.v' should be True"
    assert (
        pattern.exact_match("alu_adder.v") == False
    ), "Exact match for 'alu_adder.v' should be False"


def test_substring_count_pattern():
    # Test Substring_CountPattern
    pattern = Substring_CountPattern("alu", {"alu": (1, 3)})
    assert pattern.matches("alu.v") == True, "1 occurrence of 'alu' should match"
    assert pattern.matches("alu_alu.v") == True, "2 occurrences of 'alu' should match"
    assert (
        pattern.matches("alu_alu_alu.v") == False
    ), "3 occurrences of 'alu' should not match"
    assert (
        pattern.matches("adder.v") == False
    ), "0 occurrences of 'alu' should not match"


def test_string_match_pattern():
    # Test StringMatchPattern
    pattern = StringMatchPattern("alu.v")
    assert pattern.matches("alu.v") == True, "Exact string 'alu.v' should match"
    assert (
        pattern.matches("alu_adder.v") == False
    ), "String 'alu_adder.v' should not match 'alu.v'"
    assert (
        pattern.matches("alu.v.bak") == False
    ), "String 'alu.v.bak' should not match 'alu.v'"


def test_regex_pattern():
    # Test RegexPattern
    pattern = RegexPattern(r"alu_\d+\.v")
    assert pattern.matches("alu_1.v") == True, "Regex should match 'alu_1.v'"
    assert pattern.matches("alu_123.v") == True, "Regex should match 'alu_123.v'"
    assert pattern.matches("alu.v") == False, "Regex should not match 'alu.v'"
    assert pattern.matches("alu_abc.v") == False, "Regex should not match 'alu_abc.v'"
