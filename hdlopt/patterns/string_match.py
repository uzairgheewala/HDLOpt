from .base import Pattern


class StringMatchPattern(Pattern):
    def matches(self, filename):
        return self.pattern == filename
