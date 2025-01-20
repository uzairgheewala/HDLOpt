from typing import Dict, Type, List
from .base import Rule
from ..patterns.base import Pattern

class RuleFactory:
    """Factory for creating and managing rules."""
    
    _rules: Dict[str, Type[Rule]] = {}

    @classmethod
    def register(cls, rule_type: str) -> callable:
        """Decorator to register a rule class."""
        def inner(wrapped_class: Type[Rule]) -> Type[Rule]:
            cls._rules[rule_type] = wrapped_class
            return wrapped_class
        return inner

    @classmethod
    def create_rule(cls, rule_type: str, **kwargs) -> Rule:
        """Create a rule instance."""
        if rule_type not in cls._rules:
            raise ValueError(f"Unknown rule type: {rule_type}")
        return cls._rules[rule_type](**kwargs)

    @classmethod
    def get_registered_rules(cls) -> List[str]:
        """Get list of registered rule types."""
        return list(cls._rules.keys())