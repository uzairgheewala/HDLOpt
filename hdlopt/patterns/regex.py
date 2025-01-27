import re

from .base import Pattern


class RegexPattern(Pattern):
    def matches(self, filename):
        return re.search(self.pattern, filename) is not None
